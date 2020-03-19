//
//  LoginViewViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "LoginViewViewController.h"
#import "LoginView.h"
#import "SceneDelegate.h"
#import "DiscoveryViewController.h"
#import "GoodsViewController.h"
#import "WelcomeViewController.h"
#import "AppDelegate.h"
#import "RegisterViewController.h"
#import "LifeDiaryManage.h"
#import "LoginJSONModel.h"
#import "UploadImageModel.h"
@interface LoginViewViewController () <LoginDelegate, RegisterDelegate>

@end

@implementation LoginViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   

    self.view.backgroundColor = [UIColor whiteColor];
    _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_loginView];
    _loginView.loginDelegate = self;
    _loginView.registerDelegate = self;
    [_loginView setUI];
    
}
- (void)viewWillAppear:(BOOL)animated {
//    WelcomeViewController *wel = [[WelcomeViewController alloc] init];
//    wel.modalPresentationStyle = 0;
//    [self presentViewController:wel animated:NO completion:nil];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)login:(NSArray *)array {
//
//    SceneDelegate *sceneDelegate = (SceneDelegate *)[UIApplication sharedApplication].delegate;
    if ([array[0] isEqualToString:@"1"] && [array[1]isEqualToString:@"2"]) {
//            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//            [user setObject:array[0] forKey:@"userNameDefalut"];
//            [user setObject:array[1] forKey:@"passWordDefalut"];
//            [user synchronize];
        [self defaultPassWord];
    } else {
        
        [[LifeDiaryManage sharedLeton] loginUserToBackGroundWithUser:array[0] pass:array[1] success:^(LoginJSONModel * _Nonnull loginJSONModel) {
            if ([loginJSONModel.msg isEqualToString:@"密码错误"]) {
                UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 75, self.view.frame.size.height * 7/10, 150, 150)];
                tempLabel.text = @"账号或密码错误";
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
            } else {
            //记录登录状态
                NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                [user setObject:array[0] forKey:@"userName"];
                [user setObject:array[1] forKey:@"passWord"];
                [user setObject:[loginJSONModel.data valueForKey:@"ID"] forKey:@"ID"];
                [user synchronize];
               NSString *cookieValue =  [[LifeDiaryManage sharedLeton] ObtaionCookie];
                //上传头像
                if (self.headImage != nil) {
                    NSData *imageData= UIImageJPEGRepresentation(self->_headImage, 0.7);
                    [[LifeDiaryManage sharedLeton] uploadImageWithImageData:imageData JSESSIONID:cookieValue success:^(UploadImageModel * _Nonnull uploadModel) {
                        NSLog(@"图片url:%@", [uploadModel.data valueForKey:@"url"]);
                    } error:^(NSError * _Nonnull error) {
                        NSLog(@"头像上传失败");
                    }];
                }
                GoodsViewController *goodViewController = [[GoodsViewController alloc] init];
                UINavigationController *goodsNav = [[UINavigationController alloc] initWithRootViewController:goodViewController];
            
                DiscoveryViewController *discoveryController = [[DiscoveryViewController alloc] init];
                UINavigationController *discoveryNav = [[UINavigationController alloc] initWithRootViewController:discoveryController];
            
                UITabBarController * tabBarController = [[UITabBarController alloc] init];
                NSArray *arrayTemp = [NSArray arrayWithObjects:goodsNav, discoveryNav, nil];
                tabBarController.viewControllers = arrayTemp;
                goodsNav.title = @"物品";
                UIImage *tempImageOne = [[UIImage imageNamed:@"wupinguanli.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                [goodsNav.tabBarItem  setImage:tempImageOne];
                discoveryNav.title = @"发现";
                UIImage *tempImageTwo = [[UIImage imageNamed:@"faxian.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                [discoveryNav.tabBarItem setImage:tempImageTwo];
                //    sceneDelegate.window.rootViewController = tabBarController;
                UIWindow * window = [UIApplication  sharedApplication].windows[1];
                //  NSLog(@"%@", [UIApplication     sharedApplication].windows);
                window.rootViewController = tabBarController;
            }
        } error:^(NSError * _Nonnull error) {
        }];
    }
}
- (void)defaultPassWord {
    GoodsViewController *goodViewController = [[GoodsViewController alloc] init];
    UINavigationController *goodsNav = [[UINavigationController alloc] initWithRootViewController:goodViewController];
    
    DiscoveryViewController *discoveryController = [[DiscoveryViewController alloc] init];
    UINavigationController *discoveryNav = [[UINavigationController alloc] initWithRootViewController:discoveryController];
    
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    NSArray *arrayTemp = [NSArray arrayWithObjects:goodsNav, discoveryNav, nil];
    tabBarController.viewControllers = arrayTemp;
    goodsNav.title = @"物品";
    UIImage *tempImageOne = [[UIImage imageNamed:@"wupinguanli.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [goodsNav.tabBarItem  setImage:tempImageOne];
    discoveryNav.title = @"发现";
    UIImage *tempImageTwo = [[UIImage imageNamed:@"faxian.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [discoveryNav.tabBarItem setImage:tempImageTwo];
    //    sceneDelegate.window.rootViewController = tabBarController;
    UIWindow * window = [UIApplication sharedApplication].windows[1];
    //  NSLog(@"%@", [UIApplication sharedApplication].windows);
    window.rootViewController = tabBarController;
}
- (void)registerApp {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:NO];
    registerViewController.returnUserName = ^(NSString * _Nonnull userName, UIImage * _Nonnull image) {
        self.loginView.userTextField.text = userName;
        [self.loginView.headImageView setImage:image];
        self.headImage = image;
    };
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
