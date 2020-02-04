//
//  ModelOneCell.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
@class ModelOne;
@interface ModelOneCell : BaseTableViewCell
//GoodsView
@property (nonatomic, strong) UIImageView *imageViewOfItems;
@property (nonatomic, strong) UILabel *deadLineLabel;
@property (nonatomic, strong) UILabel *addDateLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *attributeLabel;

@property (nonatomic, strong) ModelOne *modelOne;

@end

NS_ASSUME_NONNULL_END
