//
//  AllItemsViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/8.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "AllItemsViewController.h"

@interface AllItemsViewController ()

@end

@implementation AllItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"<-Back" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButton)];
    self.navigationItem.leftBarButtonItem = _leftBarButton;
}
- (void)clickLeftBarButton {
    [self.navigationController popViewControllerAnimated:NO];
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
