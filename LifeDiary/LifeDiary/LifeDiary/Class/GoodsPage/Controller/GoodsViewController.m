//
//  GoodsViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsView.h"
#import "GoodsHeadView.h"
#import "MoreViewController.h"
#import "AllItemsViewController.h"
#import "AllItemsView.h"
#import "GoodsViewModel.h"
#import "PersonSettingViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface GoodsViewController () <clickAllBtnDeleage, clickTheHeadCell, clickPersonDelegate>

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    _goodsView = [[GoodsView alloc] initWithFrame:CGRectMake(0, 135, self.view.frame.size.width, self.view.frame.size.height - 135 - self.tabBarController.tabBar.frame.size.height)];
    [self.view addSubview:_goodsView];
    [_goodsView setUI];
    //_goodsView.cell.numberChangeDelegate = self;
    
    _headView = [[GoodsHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 135)];
    [self.view addSubview:_headView];
    _headView.deleagate = self;
    _headView.personBtnDelegate = self;
    [_headView setUI];
    
   // self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.133333 green:0.1647 blue:0.2549 alpha:1];
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
    
    _goodsModel = [[GoodsViewModel alloc] init];
    
}
//进入消息和个人中心
- (void)clickPersonBtn {
    PersonSettingViewController *personViewController = [[PersonSettingViewController alloc] init];
    personViewController.itemsMutArray = [[NSMutableArray alloc] init];
    personViewController.itemsMutArray = [self.goodsView.itemsArray mutableCopy];
    //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:personViewController];
   CATransition* transition = [CATransition animation];

    transition.type = kCATransitionPush;//可更改为其他方式

    transition.subtype = kCATransitionFromLeft;//可更改为其他方式

    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];

    [self.navigationController pushViewController:personViewController animated:NO];
    
    
}
//进入添加物品的界面
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

//添加物品界面确定按钮的方法实现
- (void)passItem:(Items *)items {
    _temp = [items copy];
    _temp.dataType = @"ModelTwo";
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjects:@[_temp.addDate,_temp.attribute,_temp.imageData,_temp.name,_temp.numberOfItem,_temp.overDue,_temp.productionDate,_temp.shelfLifeNumber,_temp.dataType,_temp.itemsState, _temp.describeString] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType",@"itemsState", @"describeString"]];
    [_goodsView.itemsArray addObject:dict];
    [_goodsModel goodsInspection:_goodsView.itemsArray overDueMutArray:_goodsView.itemsOverDueMutArray];
    [_goodsView.mainTableView reloadData];
}

//goodsView cell中物品增减方法实现 通过通知
- (void)numberChange:(NSNotification *)noti {
    NSDictionary *dict = [noti userInfo];
    UIStepper *sc = [dict valueForKey:@"stepper"];
    NSString *name = [dict valueForKey:@"name"];
        for (int i = 0; i < _goodsView.itemsArray.count; i++) {
            NSMutableDictionary *dict = _goodsView.itemsArray[i];
            if ([[dict valueForKey:@"name"] isEqual:name]) {
                [_goodsModel changeNumberOfItem:_goodsView.itemsArray[i] value:sc.value array:_goodsView.itemsArray number:i];
                break;
            }
        }
}
//模态推出右上角的选项
- (void)clickAllBtn {
    MoreViewController *more = [[MoreViewController alloc] init];
    
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:more];
    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    //加载模态视图
    more.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    more.delegate = self;
    [self presentViewController:nav animated:NO completion:nil];
}
//物品过期或者耗尽
- (void)clickHeadCell {
    AllItemsViewController *all = [[AllItemsViewController alloc] init];
    all.itemsTempMutArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < self->_goodsView.itemsArray.count; i++) {
        NSMutableDictionary *dict = [self->_goodsView.itemsArray[i] mutableCopy];
        NSString *dataType = @"ModelOne";
        [dict removeObjectForKey:@"dataType"];
        [dict setValue:dataType forKey:@"dataType"];
        [all.itemsTempMutArray addObject:dict];
        //NSLog(@"转换完成");
    }
    [self.navigationController pushViewController:all animated:NO];
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
