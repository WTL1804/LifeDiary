//
//  CellBaseModel.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "BaseModel.h"
#import "ModelOne.h"
#import "ModelTwo.h"
#import "ModelSearch.h"
@implementation BaseModel

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    BaseModel *baseModel = nil;
    if ([dictionary[@"dataType"]isEqual:@"ModelOne"]) {
        baseModel =  [[ModelOne alloc] init];
    } else if ([dictionary[@"dataType"]isEqual:@"ModelTwo"]) {
        baseModel =  [[ModelTwo alloc] init];
    } else if ([dictionary[@"dataType"] isEqual:@"ModelSearch"]) {
        baseModel = [[ModelSearch alloc] init];
    }
    [baseModel setValuesForKeysWithDictionary:dictionary];
    return baseModel;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"%@", key);
}

@end
