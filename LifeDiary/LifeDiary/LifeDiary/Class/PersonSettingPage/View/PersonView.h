//
//  PersonView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol swipeLeftGestureDelegate <NSObject>

- (void)swipLeft;

@end
@interface PersonView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UISwipeGestureRecognizer * backRecognizer;
@property (nonatomic, weak) id<swipeLeftGestureDelegate>swipeLeftDelegate;

@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *signatureLabel;
@property (nonatomic, strong) UITableView *tableView;

- (void)setUI;
@end

NS_ASSUME_NONNULL_END
