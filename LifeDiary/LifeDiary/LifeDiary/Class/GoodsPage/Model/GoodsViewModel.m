//
//  GoodsViewModel.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/9.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "GoodsViewModel.h"
#import "Items.h"
@implementation GoodsViewModel

- (void)changeNumberOfItem:(NSMutableDictionary *)itemsDict value:(double)value array:(NSMutableArray *)array number:(int)i{
     Items *tempItems = [[Items alloc] init];
    [tempItems setValuesForKeysWithDictionary:itemsDict];
    tempItems.numberOfItem = [NSNumber numberWithDouble:value];
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithObjects:@[tempItems.addDate,tempItems.attribute,tempItems.imageData,tempItems.name,tempItems.numberOfItem,tempItems.overDue,tempItems.productionDate,tempItems.shelfLifeNumber,tempItems.dataType, tempItems.itemsState, tempItems.describeString] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType", @"itemsState", @"decribeString"]];
    [array removeObjectAtIndex:i];
    [array insertObject:dict2 atIndex:i];
}

@end
