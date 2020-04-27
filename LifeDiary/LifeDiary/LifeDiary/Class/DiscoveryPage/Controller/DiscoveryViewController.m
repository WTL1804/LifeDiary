//
//  DiscoveryViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DiscoveryViewController.h"

@interface DiscoveryViewController ()

@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _discoveryView = [[DiscoveryView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_discoveryView];
    [_discoveryView setUI];
    self.title = @"发现";
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden  = NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
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
