//
//  GoodsView.h
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseTableViewCell;
NS_ASSUME_NONNULL_BEGIN

@interface GoodsView : UIView <UITableViewDelegate, UITableViewDataSource>

- (void)setUI;

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSMutableArray *itemsArray;

@property (nonatomic, strong) BaseTableViewCell *cell;

@end

NS_ASSUME_NONNULL_END
