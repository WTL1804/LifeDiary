//
//  MoreViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/7.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "MoreViewController.h"
#import "AllItemsViewController.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    _moreTableView = [[UITableView alloc] initWithFrame:CGRectMake(250, 90, 120, 150)];
    [self.view addSubview:_moreTableView];
    _moreTableView.delegate = self;
    _moreTableView.dataSource = self;
    
    _optionsArray = [[NSArray alloc] initWithObjects:@"过期物品",@"删除物品",@"分类",nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:NO completion:nil];
    self.presentingViewController.tabBarController.tabBar.hidden = NO;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *stringOfCell = @"tempCell";
    _cell = [_moreTableView dequeueReusableCellWithIdentifier:stringOfCell];
    if (_cell == nil) {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringOfCell];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _cell.frame.size.width, _cell.frame.size.height)];
        [_cell.contentView addSubview:label];
        
        _cell.contentView.alpha = 1;
        label.text = _optionsArray[indexPath.section];
        label.textAlignment = NSTextAlignmentNatural;
        
        }
    return _cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
       // _headCellBlock(@"执行headCell的点击事件");
        [self.delegate clickHeadCell];
        [self dismissViewControllerAnimated:NO completion:nil];
        
    }
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
