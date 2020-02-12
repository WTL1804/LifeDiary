//
//  MoreViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/7.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol clickTheHeadCell <NSObject>

- (void)clickHeadCell;

@end


typedef void(^clickTheHeadCellBlock)(NSString *string);
@interface MoreViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView *moreTableView;

@property (nonatomic, strong) UITableViewCell *cell;
@property (nonatomic, copy) NSArray *optionsArray;

@property (nonatomic, strong) clickTheHeadCellBlock headCellBlock;
@property (nonatomic, weak) id <clickTheHeadCell> delegate;
@end

NS_ASSUME_NONNULL_END
