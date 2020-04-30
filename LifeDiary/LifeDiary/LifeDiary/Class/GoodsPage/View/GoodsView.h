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
@protocol DeleteItemsDelegate <NSObject>

- (void)deleteItems:(NSMutableDictionary *)dict;

@end


@interface GoodsView : UIView <UITableViewDelegate, UITableViewDataSource>

- (void)setUI;

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (nonatomic, strong) NSMutableArray *itemsOverDueMutArray;
@property (nonatomic, strong) NSMutableArray *itemsDeletedMutArray;

@property (nonatomic, strong) BaseTableViewCell *cell;

@property (nonatomic, weak) id <DeleteItemsDelegate> deleteItemsDelegate;

@end

NS_ASSUME_NONNULL_END
