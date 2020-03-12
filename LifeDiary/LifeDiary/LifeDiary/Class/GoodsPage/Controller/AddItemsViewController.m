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
#import "AdditemsModel.h"

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
    
    _addItemsModel = [[AdditemsModel alloc] init];
    
    //将请求到的accesstoken返回给manage
    [self addObserver:[LifeDiaryManage sharedLeton] forKeyPath:@"access_token" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:[LifeDiaryManage sharedLeton] forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(addDone)];
    [rightBarButton setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.133333 green:0.1647 blue:0.2549 alpha:1];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.133333 green:0.1647 blue:0.2549 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = YES;
}
//添加照片
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
    
    NSData *data = UIImageJPEGRepresentation(image, 0.7);
    NSString *imageBase64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    self.image = [imageBase64 mutableCopy];
    
   // [self.addItemsView.photoBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self.addItemsView.photoImageView setImage:image];
    [self photoIdentification];
    
    
    Items *items = [[Items alloc] init];
    items.imageData = [data mutableCopy];
    [[LifeDiaryManage sharedLeton] uploadImageWithItem:items success:^(NSDictionary * _Nonnull dict) {
        NSLog(@"\n\nupload:%@", dict);
    } error:^(NSError * _Nonnull error) {
        NSLog(@"uploadError:%@",error);
    }];

    
    
    
    
    
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
    
    
    //添加照片
    if (self.addItemsView.photoImageView == nil) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 - 100, self.view.frame.size.height * 1.5 / 2, 200, 100)];
        tempLabel.text = @"请添加照片";
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.alpha = 0;
        [self.view addSubview:tempLabel];
        tempLabel.textColor = [UIColor blackColor];
        tempLabel.font = [UIFont systemFontOfSize:20];
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 1;
        }];
        
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 0;
        }];
        return ;
    }
   //添加属性
    if ([self.addItemsView.itemNamePropertiesTextField.text isEqualToString:@""]) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 - 100, self.view.frame.size.height * 1.5 / 2, 200, 100)];
        tempLabel.text = @"没有设置物品类型哦";
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.alpha = 0;
        [self.view addSubview:tempLabel];
        tempLabel.textColor = [UIColor blackColor];
        tempLabel.font = [UIFont systemFontOfSize:20];
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 1;
        }];
        
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 0;
        }];
        return ;
    }
    if ([self.addItemsView.dateTextField.text isEqualToString:@""]) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 - 100, self.view.frame.size.height * 1.5 / 2, 150, 100)];
        tempLabel.text = @"请添加生产日期";
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.alpha = 0;
        [self.view addSubview:tempLabel];
        tempLabel.textColor = [UIColor blackColor];
        tempLabel.font = [UIFont systemFontOfSize:20];
        [UIView animateWithDuration:3 animations:^{
                tempLabel.alpha = 1;
            }];
        
            [UIView animateWithDuration:3 animations:^{
                tempLabel.alpha = 0;
            }];
        return ;
    }
    if ([self.addItemsView.ShelfLifeTextField.text isEqualToString:@""]) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 - 100, self.view.frame.size.height * 1.5 / 2, 150, 100)];
        tempLabel.text = @"请添加保质期";
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.layer.cornerRadius = 5;
        tempLabel.alpha = 0;
        [self.view addSubview:tempLabel];
        tempLabel.textColor = [UIColor blackColor];
        tempLabel.font = [UIFont systemFontOfSize:20];
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 1;
        }];
    
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 0;
        }];
        return ;
    }
    if ([self.addItemsView.itemNameTextField.text isEqualToString:@""]) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 - 100, self.view.frame.size.height * 1.5 / 2, 150, 100)];
        tempLabel.text = @"请设置物品名称";
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.layer.cornerRadius = 5;
        tempLabel.alpha = 0;
        [self.view addSubview:tempLabel];
        tempLabel.textColor = [UIColor blackColor];
        tempLabel.font = [UIFont systemFontOfSize:20];
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 1;
        }];
    
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 0;
        }];
        return ;
    } else {
    
        if (![_addItemsModel goodsNameRechecking:_addItemsView.itemNameTextField.text itemsArray:_itemsNameArray]) {
                UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 - 100, self.view.frame.size.height * 1.5 / 2, 150, 100)];
                tempLabel.text = @"名称已经重复";
                tempLabel.textAlignment = NSTextAlignmentCenter;
                tempLabel.layer.cornerRadius = 5;
                tempLabel.alpha = 0;
                [self.view addSubview:tempLabel];
                tempLabel.textColor = [UIColor blackColor];
                tempLabel.font = [UIFont systemFontOfSize:20];
                [UIView animateWithDuration:3 animations:^{
                    tempLabel.alpha = 1;
                }];
            
                [UIView animateWithDuration:3 animations:^{
                    tempLabel.alpha = 0;
                }];
                return ;
            
        }
    }

    //计算过期日。
    int days = [self.addItemsView.addItems.shelfLifeNumber intValue];
    NSDate *date;
    NSTimeInterval  oneDay = 24*60*60;
    date = [self.addItemsView.addItems.productionDate initWithTimeInterval:oneDay *days sinceDate:self.addItemsView.addItems.productionDate];
    self.addItemsView.addItems.overDue = [date copy];
    //  防止添加过期物品
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:self.addItemsView.addItems.overDue options:NSCalendarWrapComponents];
    
    NSNumber *number = [NSNumber numberWithInteger:comp.day];
    if ([number intValue] <= 0) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 - 75, self.view.frame.size.height * 1.5 / 2, 150, 100)];
        tempLabel.text = @"该物品已过期";
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.alpha = 0;
        [self.view addSubview:tempLabel];
        tempLabel.textColor = [UIColor blackColor];
        tempLabel.font = [UIFont systemFontOfSize:20];
        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 1;
        }];

        [UIView animateWithDuration:3 animations:^{
            tempLabel.alpha = 0;
        }];
        return ;
    }
    [self.delegateItems passItem:self.addItemsView.addItems];
    [self.navigationController popViewControllerAnimated:YES];
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
