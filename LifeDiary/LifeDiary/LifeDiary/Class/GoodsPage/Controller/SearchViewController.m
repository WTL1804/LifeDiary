//
//  SearchViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/27.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _searchView.backgroundColor = [UIColor whiteColor];
    [_searchView setUI];
    [self.view addSubview:_searchView];
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
