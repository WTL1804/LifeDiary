//
//  ModelTwoCell.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "BaseTableViewCell.h"
@class ModelTwo;
NS_ASSUME_NONNULL_BEGIN
@interface ModelTwoCell : BaseTableViewCell
@property (nonatomic, strong) ModelTwo *modelTwo;

@property (nonatomic, strong) UIImageView *imageViewOfItems;

@property (nonatomic, strong) UILabel *deadLineLabel;
@property (nonatomic, strong) UILabel *numberOfItemLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *attributeLabel;

@property (nonatomic, strong) UIStepper *increaseStepper;

@end

NS_ASSUME_NONNULL_END
