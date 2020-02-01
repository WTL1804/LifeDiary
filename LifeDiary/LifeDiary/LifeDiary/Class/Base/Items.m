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
    }
    return self;
}
- (id)copy {
    
}
- (id)mutableCopy {
    
}

@end
