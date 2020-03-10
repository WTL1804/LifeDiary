//
//  AdditemsModel.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/9.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "AdditemsModel.h"

@implementation AdditemsModel

- (BOOL)goodsNameRechecking:(NSString *)itemName itemsArray:(NSArray *)array {
    for (NSString *string in array) {
        if ([string isEqualToString:itemName]) {
            return false;
        }
    }
    return true;
}

@end
