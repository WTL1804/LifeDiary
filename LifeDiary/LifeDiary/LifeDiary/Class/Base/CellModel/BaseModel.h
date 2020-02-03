//
//  CellBaseModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject


+ (instancetype)initWithDictionary:(NSDictionary *) dictionary;
@property (nonatomic, copy) NSString *name;
//分类的根据
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) NSDate *productionDate;
@property (nonatomic) NSNumber  *shelfLifeNumber;
@property (nonatomic, copy) NSDate *addDate;
@property (nonatomic, copy) NSData *imageData;
@property (nonatomic) NSNumber *numberOfItem;
@property (nonatomic, copy) NSDate *overDue;
@property (nonatomic, copy) NSString *dataType;

@end

NS_ASSUME_NONNULL_END
