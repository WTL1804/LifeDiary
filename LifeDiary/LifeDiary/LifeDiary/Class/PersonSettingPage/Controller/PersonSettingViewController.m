//
//  PersonSettingViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "PersonSettingViewController.h"
#import "PersonView.h"
#import "PersonSettingModel.h"
#import "LifeDiaryManage.h"
#import <UIImageView+WebCache.h>
@interface PersonSettingViewController () <swipeLeftGestureDelegate>

@end

@implementation PersonSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _personModel = [[PersonSettingModel alloc] init];
   
    _mainView = [[PersonView alloc] init];
    _mainView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_mainView];
    _mainView.swipeLeftDelegate = self;
    
    _mainView.itemsMutArray = [_personModel itemsArrayDealWithModle:_itemsMutArray];
    
    [_mainView setUI];
    
    self.navigationItem.title = @"主页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self acquireHeadImage];
}
- (void)acquireHeadImage {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [[LifeDiaryManage sharedLeton] acquireHeadImageWithUserID:[user valueForKey:@"ID"] success:^(NSDictionary * _Nonnull dict) {
            [self->_mainView.headImageView sd_setImageWithURL:[dict valueForKey:@"data"]];
    } error:^(NSError * _Nonnull error) {
        
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    //阻止滑动返回的手势
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//
//    }
    self.navigationItem.hidesBackButton = YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)swipLeft {
    [self.navigationController popViewControllerAnimated:YES];
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
