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
@interface PersonView : UIView 

@property (nonatomic, strong) UISwipeGestureRecognizer * backRecognizer;
@property (nonatomic, weak) id<swipeLeftGestureDelegate>swipeLeftDelegate;

@property (nonatomic, strong) UIImageView *backGroundImageView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *signatureLabel;

@property (nonatomic, strong) UILabel *welcomeLabel;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UILabel *describeTempLabel;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray *itemsMutArray;

- (void)setUI;
@end

NS_ASSUME_NONNULL_END
