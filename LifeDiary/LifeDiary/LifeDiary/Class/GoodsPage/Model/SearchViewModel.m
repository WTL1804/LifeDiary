//
//  SearchViewModel.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/28.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "SearchViewModel.h"
#import <FMDB.h>
@implementation SearchViewModel
- (instancetype)init {
     if (self = [super init]) {
        NSString *docuPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *doPath = [docuPath stringByAppendingPathComponent:@"itemsArray.sqlite"];
         self.doPath = doPath;
         NSLog(@"%@",doPath);
     }
    return self;
    
}
- (NSArray *)searchDataBaseUseingText:(NSString *)text {
    FMDatabase *db = [FMDatabase databaseWithPath:_doPath];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [db open];
//    if (![db open]) {
//        NSLog(@"数据库打开失败");
//    } else {
//        NSLog(@"数据库打开成功");
//    }
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT name FROM wh_items where name like '%%%@%%' order by (case when name = '%@' then 1 when name like '%@%%' then 2 when name like '_%@%%' then 3 when name like '__%@%%' then 4 when name like '___%@%%' then 5 when name like '%%%@%%' then 6 else 0 end );", text, text, text, text, text, text, text];

    FMResultSet *resultSet = [db executeQuery:selectSQL];
    while ([resultSet next]) {
        //用数组arr保存一条记录转成的字典
        [array addObject:[resultSet resultDictionary]];
    }
    [db close];
    return array;
}
- (NSMutableArray *)matchingItemsFromNameArray:(NSArray *)nameArray originalArray:(NSMutableArray *)originalMutArray {
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *dictI in nameArray) {
        for (NSMutableDictionary *dictJ in originalMutArray) {
            if ([[dictI valueForKey:@"name"] isEqual: [dictJ valueForKey:@"name"]]) {
                [temp addObject:[dictJ mutableCopy]];
            }
        }
    }
    return temp;
}
- (NSInteger)matchingLocationFromString:(NSString *)string originalArray:(NSMutableArray *)originalMutArray {
    NSInteger number = 0;
    for (int i = 0; i < originalMutArray.count; i++) {
        NSMutableDictionary *dict = originalMutArray[i];
        if ([[dict valueForKey:@"name"] isEqual:string]) {
            number = i;
        }
    }
    return number;
}
@end
