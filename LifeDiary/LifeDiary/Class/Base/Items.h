//
//  Items.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/27.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Items : NSObject
@property (nonatomic, copy) NSString *name;
//分类的根据
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) NSString *productionDate;
@property (nonatomic, copy) NSString *ShelfLifeDate;
@property (nonatomic, copy) NSString *addDate;
@property (nonatomic, copy) NSString *image;
@end

NS_ASSUME_NONNULL_END
