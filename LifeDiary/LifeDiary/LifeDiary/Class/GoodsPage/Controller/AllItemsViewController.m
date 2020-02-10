//
//  AllItemsViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/8.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "AllItemsViewController.h"
#import "AllItemsView.h"
@interface AllItemsViewController ()

@end

@implementation AllItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"<-Back" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButton)];
    self.navigationItem.leftBarButtonItem = _leftBarButton;
    
    _allView = [[AllItemsView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height)];
    //_allView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height);

    [self.view addSubview:_allView];
    _allView.itemsMutArray = [[NSMutableArray alloc] init];
    _allView.itemsMutArray = _itemsTempMutArray;
    [_allView setUI];
}
- (void)clickLeftBarButton {
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
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
