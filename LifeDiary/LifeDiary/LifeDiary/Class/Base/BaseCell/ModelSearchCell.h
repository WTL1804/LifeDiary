//
//  ModelSearchCell.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/28.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "BaseTableViewCell.h"
@class ModelSearch;
NS_ASSUME_NONNULL_BEGIN

@interface ModelSearchCell : BaseTableViewCell
@property (nonatomic, strong) ModelSearch *modelSearch;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *itemsPhotoImageView;
@end

NS_ASSUME_NONNULL_END
