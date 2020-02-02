//
//  AddItemsViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "AddItemsViewController.h"
#import "LifeDiaryManage.h"
#import "Access_tokenModel.h"
#import "PhotoIdentificationModel.h"
@interface AddItemsViewController () <ClickCamera>

@end

@implementation AddItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加物品";
    _addItemsView = [[AddItemsView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height -88)];
    [self.view addSubview:_addItemsView];
    _addItemsView.navigationFrame = self.navigationController.navigationBar.frame;
    [_addItemsView setUI];
    _addItemsView.delegateClickCamera = self;
    [self obtainAccess_token];
    
    //将请求到的accesstoken返回给manage
    [self addObserver:[LifeDiaryManage sharedLeton] forKeyPath:@"access_token" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:[LifeDiaryManage sharedLeton] forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(addDone)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = YES;
}
- (void)clickCamera {
    self.imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.editing = YES;
    _imagePicker.delegate = self;
    _imagePicker.allowsEditing = YES;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择打开方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        self->_imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self->_imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
        self->_imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        [self presentViewController:self->_imagePicker animated:YES completion:nil];
    
    
    }];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:camera];
    [alert addAction:photo];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *imageBase64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    self.image = [imageBase64 mutableCopy];
    
    [self.addItemsView.photoBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self photoIdentification];
    
    self.addItemsView.addItems.imageData = [data copy];
}
- (void)obtainAccess_token {
    [[LifeDiaryManage sharedLeton] toOtainAccess_token:^(Access_tokenModel * accessTokenModel) {
        self.access_token = accessTokenModel.access_token;
    } error:^(NSError * _Nonnull error) {
        NSLog(@"accesss_Token请求失败");
    }];
    
}
//图像识别
- (void)photoIdentification {
    [[LifeDiaryManage sharedLeton] identification:^(PhotoIdentificationModel * _Nonnull identificationModel) {
        NSLog(@"照片里很可能是%@   概率为%@", [identificationModel.result[0] valueForKey:@"keyword"], [identificationModel.result[0] valueForKey:@"score"]);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.addItemsView.addItems.attribute = [identificationModel.result[0] valueForKey:@"keyword"];
            self.addItemsView.itemNamePropertiesTextField.text = [identificationModel.result[0] valueForKey:@"keyword"];
            
        });
        
    } error:^(NSError * _Nonnull error) {
        NSLog(@"图像识别失败");
    }];
}
- (void)addDone {
    if (self.addItemsView.addItems.imageData != nil) {
        if (self.addItemsView.addItems.name != nil) {
            if (self.addItemsView.addItems.productionDate != nil) {
                if (self.addItemsView.addItems.shelfLifeNumber != nil) {
                    //计算过期日。
                    int days = [self.addItemsView.addItems.shelfLifeNumber intValue];
                    NSDate *date;
                    NSTimeInterval  oneDay = 24*60*60;
                    date = [self.addItemsView.addItems.productionDate initWithTimeInterval:oneDay *days sinceDate:self.addItemsView.addItems.productionDate];
                    self.addItemsView.addItems.overDue = [date copy];
                    [self.delegateItems passItem:self.addItemsView.addItems];
                    [self.navigationController popViewControllerAnimated:YES];
                }
            }
            
        }
    }
}
- (void)dealloc {
    [self removeObserver:[LifeDiaryManage sharedLeton] forKeyPath:@"access_token"];
     [self removeObserver:[LifeDiaryManage sharedLeton] forKeyPath:@"image"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
