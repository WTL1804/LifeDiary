//
//  RegisterViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "LifeDiaryManage.h"
#import "RegisterJSONModel.h"
@interface RegisterViewController () <RegisterUserDelegate, ClickHeadButtonDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _registerView = [[RegisterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_registerView];
    [_registerView setUI];
    _registerView.RegiserDelegate = self;
    _registerView.clickHeadButtonDelegate = self;
    
}
- (void)registerUser:(NSArray *)array {
    [[LifeDiaryManage sharedLeton] regisetUserToBackGroundWithUser:array[0] pass:array[1] success:^(RegisterJSONModel * _Nonnull registerJSONModel) {
        if ([registerJSONModel.msg isEqualToString:@"注册成功"]) {
            [self.navigationController popViewControllerAnimated:NO];
            self.returnUserName(array[0], array[2]);
        } else if ([registerJSONModel.msg isEqualToString:@"用户名已存在"]){
            UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 75, self.view.frame.size.height * 7/10, 150, 150)];
            tempLabel.text = @"用户名已存在";
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
        }
    } error:^(NSError * _Nonnull error) {
        
    }];
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}
- (void)changeHeadImageView {
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
    
    //NSData *data = UIImageJPEGRepresentation(image, 0.7);
    //NSString *imageBase64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    self.registerView.headImage = image;
    [self.registerView.headImageButton setImage:image forState:UIControlStateNormal];
    
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
