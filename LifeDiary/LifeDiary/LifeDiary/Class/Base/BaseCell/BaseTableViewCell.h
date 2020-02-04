//
//  BaseTableViewCell.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BaseModel;
@interface BaseTableViewCell : UITableViewCell



+ (instancetype)initWithModel:(BaseModel *)baseModel;

//子类的布局方法
- (void)setLayOutInSubclass:(BaseModel *)baseModel;
@end

NS_ASSUME_NONNULL_END
