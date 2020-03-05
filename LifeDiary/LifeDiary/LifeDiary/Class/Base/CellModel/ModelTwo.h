//
//  cellModelTwo.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelTwo : BaseModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) NSDate *productionDate;
@property (nonatomic) NSNumber  *shelfLifeNumber;
@property (nonatomic, copy) NSDate *addDate;
@property (nonatomic, copy) NSData *imageData;
@property (nonatomic) NSNumber *numberOfItem;
@property (nonatomic, copy) NSDate *overDue;
@property (nonatomic, copy) NSString *dataType;
@property (nonatomic, copy) NSString *itemsState;
@property (nonatomic, copy) NSString *describeString;
@end

NS_ASSUME_NONNULL_END
