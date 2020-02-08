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
#import "MoreViewController.h"

@interface GoodsViewController () <clickAllBtnDeleage>

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WelcomeViewController *welcomeViewController = [[WelcomeViewController alloc] init];
    welcomeViewController.modalPresentationStyle = 0;
    //[self presentViewController:welcomeViewController animated:NO completion:nil];
    
    
    
    _goodsView = [[GoodsView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100 )];
    [self.view addSubview:_goodsView];
    [_goodsView setUI];
    //_goodsView.cell.numberChangeDelegate = self;
    
    _headView = [[GoodsHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [self.view addSubview:_headView];
    _headView.deleagate = self;
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
    
    //通过通知来实现工厂cell的传值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(numberChange:) name:@"numberChange" object:nil];
}

- (void)clickButton {
   
    AddItemsViewController *addViewController = [[AddItemsViewController alloc] init];
    self.temp = [[Items alloc] init];
    addViewController.delegateItems = self;
    [self.navigationController pushViewController:addViewController animated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)passItem:(Items *)items {
    _temp = [items copy];
  //  NSLog(@"%@\ncopy:%@\n",items, temp);
//    NSLog(@"addDate:%p\nname:%p\nattribute:%p\nshelfLifeNumber:%p\nproduct:%p\nImageData:%p",items.addDate,items.name, items.attribute,items.shelfLifeNumber, items.productionDate,items.imageData);
//    NSLog(@"addDate:%p\nname:%p\nattribute:%p\nshelfLifeNumber:%p\nproduct:%p\nImageData:%p",temp.addDate,temp.name, temp.attribute,temp.shelfLifeNumber, temp.productionDate,temp.imageData);
//    NSLog(@"123");
    _temp.dataType = @"ModelTwo";
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjects:@[_temp.addDate,_temp.attribute,_temp.imageData,_temp.name,_temp.numberOfItem,_temp.overDue,_temp.productionDate,_temp.shelfLifeNumber,_temp.dataType] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType"]];
    [_goodsView.itemsArray addObject:dict];
    [_goodsView.mainTableView reloadData];
}

- (void)numberChange:(NSNotification *)noti {
    NSDictionary *dict = [noti userInfo];
    UIStepper *sc = [dict valueForKey:@"stepper"];
    NSString *name = [dict valueForKey:@"name"];
        Items *tempItems = [[Items alloc] init];
        for (int i = 0; i < _goodsView.itemsArray.count; i++) {
            NSMutableDictionary *dict = _goodsView.itemsArray[i];
            if ([[dict valueForKey:@"name"] isEqual:name]) {
                
                [tempItems setValuesForKeysWithDictionary:dict];
                tempItems.numberOfItem = [NSNumber numberWithDouble:sc.value];
                NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithObjects:@[tempItems.addDate,tempItems.attribute,tempItems.imageData,tempItems.name,tempItems.numberOfItem,tempItems.overDue,tempItems.productionDate,tempItems.shelfLifeNumber,tempItems.dataType] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType"]];
                [_goodsView.itemsArray removeObjectAtIndex:i];
                [_goodsView.itemsArray insertObject:dict2 atIndex:i];
                break;
            }
        }
}
- (void)clickAllBtn {
    MoreViewController *more = [[MoreViewController alloc] init];
    
    //more.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:more];
    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    //加载模态视图
    more.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    //self.tabBarController.tabBar.hidden = YES;
    [self presentViewController:nav animated:NO completion:nil];
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
