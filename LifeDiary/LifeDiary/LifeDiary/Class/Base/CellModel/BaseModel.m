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
@implementation BaseModel

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    BaseModel *baseModel = nil;
    if ([dictionary[@"tag"]isEqual:@"ModelOne"]) {
        return [[ModelOne alloc] init];
    } else if ([dictionary[@"tag"]isEqual:@"ModelOne"]) {
        return [[ModelTwo alloc] init];
    }
    [baseModel setValuesForKeysWithDictionary:dictionary];
    return baseModel;
}
@end
