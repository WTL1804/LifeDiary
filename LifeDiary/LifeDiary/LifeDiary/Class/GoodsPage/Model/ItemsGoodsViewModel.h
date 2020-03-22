//
//  itemsGoodsViewModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/6.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DataArrayModel
@end

@interface DataArrayModel : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) NSString *productionDateString;
@property (nonatomic) NSNumber  *shelfLifeNumber;
@property (nonatomic, copy) NSString *addDateString;
@property (nonatomic, copy) NSString *productImage;
@property (nonatomic) NSNumber *numberOfItem;
@property (nonatomic, copy) NSString *overDueString;
//@property (nonatomic, copy) NSString *dataType;
@property (nonatomic, copy) NSNumber *itemsState;
@property (nonatomic, copy) NSString *describeString;

@end

@interface ItemsGoodsViewModel : JSONModel
@property (nonatomic, strong) NSArray <DataArrayModel> *data;

- (NSDate *)ProcessingDateFromString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
