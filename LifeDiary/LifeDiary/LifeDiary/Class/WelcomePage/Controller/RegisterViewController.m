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
@interface RegisterViewController () <RegisterUserDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _registerView = [[RegisterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_registerView];
    [_registerView setUI];
    _registerView.RegiserDelegate = self;
    
}
- (void)registerUser:(NSArray *)array {
    [LifeDiaryManage sharedLeton].userNameRegister = array[0];
    [LifeDiaryManage sharedLeton].passWordRegister = array[1];
    [[LifeDiaryManage sharedLeton] regisetUserToBackGround:^(RegisterJSONModel * _Nonnull registerJSONModel) {
        if ([registerJSONModel.msg isEqualToString:@"注册成功"]) {
            [self.navigationController popViewControllerAnimated:NO];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
