//
//  AllItemsView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/9.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseTableViewCell;
@class BaseModel;
@class BezierPathView;
NS_ASSUME_NONNULL_BEGIN

@interface AllItemsView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) BaseTableViewCell *baseCell;
@property (nonatomic, strong) NSMutableArray *itemsOverDueMutArray;



- (void)setUI;
@end

NS_ASSUME_NONNULL_END
