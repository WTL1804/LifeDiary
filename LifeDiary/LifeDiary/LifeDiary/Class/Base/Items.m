//
//  Items.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/27.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "Items.h"

@implementation Items
- (instancetype)init {
    if (self = [super init]) {
        _name = @"";
        _shelfLifeNumber = [NSNumber numberWithInt:30];
        NSDate *now = [NSDate date];
        NSDateFormatter *matter = [[NSDateFormatter alloc] init];
        [matter setDateFormat:@"yyyy-MM-dd"];
//        NSString *nowString = [matter stringFromDate:now];
        _productionDate = now;
        _addDate = now;
        _imageData = nil;
        _numberOfItem = [NSNumber numberWithInt:1];
        _overDue = now;
    }
    return self;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    Items *items = [[Items alloc] init];
    items.addDate = [_addDate copy];
    items.attribute = [_attribute mutableCopy];
    items.imageData = [_imageData mutableCopy];
    items.name = [_name mutableCopy];
    items.numberOfItem = _numberOfItem;
    items.productionDate = [_productionDate copy];
    items.shelfLifeNumber = _shelfLifeNumber;
    items.overDue = [_overDue copy];
    return items;
}
- (id)copyWithZone:(NSZone *)zone {
    Items *items = [Items allocWithZone:zone];
    items.addDate = _addDate;
    items.attribute = _attribute;
    items.imageData = _imageData;
    items.name = _name;
    items.numberOfItem = _numberOfItem;
    items.productionDate = _productionDate;
    items.shelfLifeNumber = _shelfLifeNumber;
    items.overDue = _overDue;
    return items;
}

@end
