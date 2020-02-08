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

@interface GoodsHeadView : UIView
- (void)setUI;

@property (nonatomic, strong) UITextField *searchField;

@property (nonatomic, strong) UIButton *personBtn;
@property (nonatomic, strong) UIButton *allBtn;
@property (nonatomic, weak) id <clickAllBtnDeleage>deleagate;



@end

NS_ASSUME_NONNULL_END
