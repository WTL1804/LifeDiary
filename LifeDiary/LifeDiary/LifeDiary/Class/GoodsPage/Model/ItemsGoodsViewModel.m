//
//  itemsGoodsViewModel.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/6.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "ItemsGoodsViewModel.h"

@implementation ItemsGoodsViewModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DataArrayModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"name": @"proname", @"attribute": @"property", @"overDueString": @"expirationDate", @"shelfLifeNumber": @"exptime", @"numberOfItem": @"stock", @"productionDateString": @"productionDate", @"addDateString": @"addDate", @"itemsState": @"status", @"describeString":@"detail"}];
    
}

@end
