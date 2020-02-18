//
//  PersonSettingViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "PersonSettingViewController.h"
#import "PersonView.h"
@interface PersonSettingViewController ()

@end

@implementation PersonSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mainView = [[PersonView alloc] init];
    _mainView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height);
    [self.view addSubview:_mainView];
    self.navigationController.navigationItem.leftBarButtonItem.enabled = NO;
    [_mainView setUI];
    
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
