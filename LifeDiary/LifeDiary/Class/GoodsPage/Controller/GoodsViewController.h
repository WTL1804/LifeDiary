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
NS_ASSUME_NONNULL_BEGIN

@interface GoodsViewController : UIViewController

@property (nonatomic, strong) GoodsView *goodsView;
@property (nonatomic, strong) GoodsHeadView *headView;

@property (nonatomic, strong) UIButton *addButton;

@end

NS_ASSUME_NONNULL_END
