//
//  GoodsViewModel.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/9.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "GoodsViewModel.h"
#import "Items.h"
#import <FMDB.h>
#import <SDWebImageManager.h>

@implementation GoodsViewModel

- (void)changeNumberOfItem:(NSMutableDictionary *)itemsDict value:(double)value array:(NSMutableArray *)array number:(int)i{
     Items *tempItems = [[Items alloc] init];
    [tempItems setValuesForKeysWithDictionary:itemsDict];
    tempItems.numberOfItem = [NSNumber numberWithDouble:value];
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithObjects:@[tempItems.addDate,tempItems.attribute,tempItems.imageData,tempItems.name,tempItems.numberOfItem,tempItems.overDue,tempItems.productionDate,tempItems.shelfLifeNumber,tempItems.dataType, tempItems.itemsState, tempItems.describeString] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType", @"itemsState", @"describeString"]];
    [array removeObjectAtIndex:i];
    [array insertObject:dict2 atIndex:i];
}
- (void)goodsInspection:(NSMutableArray *)array overDueMutArray:(nonnull NSMutableArray *)overDueArray {
    for (int i = 0; i < array.count; i++) {
        Items *tempItems = [[Items alloc] init];
       [tempItems setValuesForKeysWithDictionary:array[i]];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:tempItems.overDue options:NSCalendarWrapComponents];
        NSNumber *number = [NSNumber numberWithInteger:comp.day];
        if ([number intValue] <= 0) {
            tempItems.itemsState = [NSNumber numberWithInt:1];
            NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithObjects:@[tempItems.addDate,tempItems.attribute,tempItems.imageData,tempItems.name,tempItems.numberOfItem,tempItems.overDue,tempItems.productionDate,tempItems.shelfLifeNumber,tempItems.dataType, tempItems.itemsState, tempItems.describeString] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType", @"itemsState", @"decribeString"]];
            [overDueArray addObject:dict2];
            [array removeObjectAtIndex:i];
        }
    }
}
- (NSDictionary *)ProcessingNetworkRequestDataOfItems:(NSDictionary *)dict {
    NSDate *addDate =  [self ProcessingDateFromString: [dict valueForKey:@"addDateString"]];
    NSDate *productionDate = [self ProcessingDateFromString: [dict valueForKey:@"productionDateString"]];
    NSDate *overDue = [self ProcessingDateFromString: [dict valueForKey:@"overDueString"]];
    NSString *attribute = [dict valueForKey:@"attribute"];
    NSString *name = [dict valueForKey:@"name"];
    NSNumber *shelfLifeNumber = [dict valueForKey:@"shelfLifeNumber"];
    NSString *itemsState = [dict valueForKey:@"itemsState"];
    NSNumber *numberOfItem = [dict valueForKey:@"numberOfItem"];
    NSString *dataType = @"ModelTwo";
    NSString *describeString = [dict valueForKey:@"describeString"];
   // UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:[dict valueForKey:@"productImage"]];
    NSURL *urlImage = [NSURL URLWithString:[dict valueForKey:@"productImage"]];
    NSData *imageData = [NSData dataWithContentsOfURL:urlImage options:0 error:nil];
    
    
    NSMutableDictionary *dictTemp = [NSMutableDictionary dictionaryWithObjects:@[addDate,attribute,imageData,name,numberOfItem,overDue,productionDate,shelfLifeNumber,dataType,itemsState, describeString] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType",@"itemsState", @"describeString"]];
    return dictTemp;
}
- (NSDate *)ProcessingDateFromString:(NSString *)string {
     
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"yyyy-MM-dd"];
     NSDate *date = [dateFormatter dateFromString:string];
    return date;
}
- (void)storeTheItemsIntoDataBase:(NSArray *)array {
    FMDatabase *db = [FMDatabase databaseWithPath:_doPath];
    [db open];
    if (![db open]) {
        NSLog(@"数据库打开失败");
    } else {
        NSLog(@"数据库打开成功");
    }
   
    NSString *sqlToCreat = @"create table if not exists wh_items('name' TEXT NOT NULL, 'attribute' TEXT NOT NULL, 'shelfLifeNumber' INTEGER, 'productionDate' TEXT NOT NULL, 'addDate' TEXT NOT NULL, 'imageData' BLOB, 'numberOfItem' INTEGER, 'overDue' TEXT NOT NULL, 'dataType' TEXT NOT NULL, 'itemsState' INTEGER, describeString TEXT NOT NULL);";
    BOOL resultToCreat = [db executeUpdate:sqlToCreat];
       if (resultToCreat) {
           NSLog(@"create table success");
       }
     
    //插入新数据
    for (NSDictionary *dict in array) {
        
        NSString *addDate =  [self ProcessionDateToString:[dict valueForKey:@"addDate"]];
         NSString *productionDate = [self ProcessionDateToString: [dict valueForKey:@"productionDate"]];
         NSString *overDue = [self ProcessionDateToString: [dict valueForKey:@"overDue"]];
         NSString *attribute = [dict valueForKey:@"attribute"];
         NSString *name = [dict valueForKey:@"name"];
         NSNumber *shelfLifeNumber = [dict valueForKey:@"shelfLifeNumber"];
         NSString *itemsState = [dict valueForKey:@"itemsState"];
         NSNumber *numberOfItem = [dict valueForKey:@"numberOfItem"];
        NSString *dataType = [dict valueForKey:@"dataType"];
         NSString *describeString = [dict valueForKey:@"describeString"];
        //NSData *imageData = [dict objectForKey:@"imageDate"];
        //插入数据
        BOOL resultToInsert = [db executeUpdateWithFormat:@"insert into wh_items(name, attribute, shelfLifeNumber, productionDate, addDate, imageData, numberOfItem, overDue, dataType, itemsState, describeString) values(%@, %@, %ld, %@, %@, %@, %ld, %@, %@, %ld, %@);", name, attribute, [shelfLifeNumber integerValue], productionDate, addDate, [dict valueForKey:@"imageData"], [numberOfItem integerValue], overDue, dataType, [itemsState integerValue], describeString];
        if (resultToInsert) {
          //  NSLog(@"数据存入数据库成功");
        }
    }
    NSLog(@"存入数据完成");
    [db close];
}
- (NSString *)ProcessionDateToString:(NSDate *)date {
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];

    [dateFormat setDateFormat:@"yyyy-MM-dd"];

    NSString* string=[dateFormat stringFromDate:date];

    return string;
}
- (NSMutableArray *)ExtractDataFromTheLocalDatabase {
    FMDatabase *db = [FMDatabase databaseWithPath:_doPath];
    [db open];
    if (![db open]) {
        NSLog(@"数据库打开失败");
    } else {
        NSLog(@"数据库打开成功");
    }
    NSString *querySql = @"select * from wh_items;";

    NSMutableArray *arr = [[NSMutableArray alloc] init];

    FMResultSet *result = [db executeQuery:querySql];

    while ([result next]) {
    //用数组arr保存一条记录转成的字典
        [arr addObject:[result resultDictionary]];
    }
    
   // NSLog(@"arr:%@", arr);
    NSMutableArray *arryTemp = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in arr) {
        NSDictionary * dictTemp =  [self ProcessingDatabaseResult:dict];
        [arryTemp addObject:dictTemp];
    }
    [db close];
    return arryTemp;
}
- (NSDictionary *)ProcessingDatabaseResult:(NSDictionary *)dict {
    NSDate *addDate =  [self ProcessingDateFromString: [dict valueForKey:@"addDate"]];
     NSDate *productionDate = [self ProcessingDateFromString: [dict valueForKey:@"productionDate"]];
     NSDate *overDue = [self ProcessingDateFromString: [dict valueForKey:@"overDue"]];
     NSString *attribute = [dict valueForKey:@"attribute"];
     NSString *name = [dict valueForKey:@"name"];
     NSNumber *shelfLifeNumber = [dict valueForKey:@"shelfLifeNumber"];
     NSString *itemsState = [dict valueForKey:@"itemsState"];
     NSNumber *numberOfItem = [dict valueForKey:@"numberOfItem"];
     NSString *dataType = @"ModelTwo";
     NSString *describeString = [dict valueForKey:@"describeString"];
    // UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:[dict valueForKey:@"productImage"]];
     
     NSMutableDictionary *dictTemp = [NSMutableDictionary dictionaryWithObjects:@[addDate,attribute,[dict valueForKey:@"imageData"],name,numberOfItem,overDue,productionDate,shelfLifeNumber,dataType,itemsState, describeString] forKeys:@[@"addDate",@"attribute",@"imageData",@"name",@"numberOfItem",@"overDue",@"productionDate",@"shelfLifeNumber",@"dataType",@"itemsState", @"describeString"]];
     return dictTemp;
}
- (instancetype)init {
     if (self = [super init]) {
        NSString *docuPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *doPath = [docuPath stringByAppendingPathComponent:@"itemsArray.sqlite"];
         self.doPath = doPath;
         NSLog(@"%@",doPath);
     }
    return self;
    
}
- (void)deleteAllItems {
    FMDatabase *db = [FMDatabase databaseWithPath:self.doPath];
        if ([db open]) {
            NSString *sql = @"delete from wh_items";
            BOOL res = [db executeUpdate:sql];
            if (!res) {
                NSLog(@"数据删除失败");
            } else {
                NSLog(@"数据删除成功");
            }
            [db close];
        }
}
@end
