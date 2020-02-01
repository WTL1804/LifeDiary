//
//  GoodsViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GoodsView;
@class GoodsHeadView;
#import "Items.h"
#import "AddItemsViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface GoodsViewController : UIViewController <addItemDelegate>

@property (nonatomic, strong) GoodsView *goodsView;
@property (nonatomic, strong) GoodsHeadView *headView;

@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) Items *tempItems;
@end

NS_ASSUME_NONNULL_END
