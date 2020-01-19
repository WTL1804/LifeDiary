//
//  GoodsViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "GoodsViewController.h"
#import "WelcomeViewController.h"
#import "GoodsView.h"
#import "GoodsHeadView.h"
#import "AddItemsViewController.h"
@interface GoodsViewController ()

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WelcomeViewController *welcomeViewController = [[WelcomeViewController alloc] init];
    welcomeViewController.modalPresentationStyle = 0;
    //[self presentViewController:welcomeViewController animated:NO completion:nil];
    
    
    
    _goodsView = [[GoodsView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100 - self.tabBarController.tabBar.bounds.size.height)];
    [self.view addSubview:_goodsView];
    [_goodsView setUI];
    
    _headView = [[GoodsHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [self.view addSubview:_headView];
    [_headView setUI];
    
    self.tabBarController.tabBar.tintColor = [UIColor greenColor];
    self.tabBarController.tabBar.backgroundImage = [UIImage new];
    
    UIImageView *tabBarbackGroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -1, self.tabBarController.tabBar.frame.size.width, 1)];
    UIImage *temImageOne = [UIImage imageNamed:@"whiteBackGroundImage.png"];
    tabBarbackGroundImageView.image  = temImageOne;
    [self.tabBarController.tabBar addSubview:tabBarbackGroundImageView];
    self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    _addButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-36, -36, 72, 72)];
   
    UIImage *tempImage = [[UIImage imageNamed:@"tianjia"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_addButton setImage:tempImage forState:UIControlStateNormal];
    [self.tabBarController.tabBar addSubview:_addButton];
    [self.addButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    //高斯模糊
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
//    effectview.frame =self.view.frame;
//    [self.view addSubview:effectview];
    
    self.title = @"物品";
}

- (void)clickButton {
    NSLog(@"点击事件");
    AddItemsViewController *addViewController = [[AddItemsViewController alloc] init];
    [self.navigationController pushViewController:addViewController animated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated {
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
