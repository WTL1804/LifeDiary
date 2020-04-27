//
//  GoodsHeadView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol clickAllBtnDeleage <NSObject>

- (void)clickAllBtn;

@end

@protocol clickPersonDelegate <NSObject>

- (void)clickPersonBtn;

@end

@protocol textFieldFocusedDelegate <NSObject>

- (void)textFieldFocused;

@end

@interface GoodsHeadView : UIView <UITextFieldDelegate>
- (void)setUI;

@property (nonatomic, strong) UITextField *searchField;

@property (nonatomic, strong) UIButton *personBtn;
@property (nonatomic, strong) UIButton *allBtn;

@property (nonatomic, weak) id <clickAllBtnDeleage>deleagate;
@property (nonatomic, weak) id <clickPersonDelegate>personBtnDelegate;
@property (nonatomic, weak) id <textFieldFocusedDelegate> textFieldFocusedDelegate;

@property (nonatomic, strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
