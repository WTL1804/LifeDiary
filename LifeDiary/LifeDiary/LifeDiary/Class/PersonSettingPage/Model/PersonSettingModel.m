//
//  PersonSettingModel.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/25.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "PersonSettingModel.h"

@implementation PersonSettingModel

- (NSMutableArray *)itemsArrayDealWithModle:(NSMutableArray *)array {
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < array.count; i++) {
        NSMutableDictionary *dict = array[i];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:[dict valueForKey:@"overDue"] options:NSCalendarWrapComponents];
            NSNumber *number = [NSNumber numberWithInteger:comp.day];
        if ([number intValue] < 30) {
            [returnArray addObject:dict];
        }
        
    }
    return returnArray;
}
@end
