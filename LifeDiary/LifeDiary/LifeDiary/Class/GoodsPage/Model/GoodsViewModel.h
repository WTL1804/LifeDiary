//
//  GoodsViewModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/9.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface GoodsViewModel : NSObject
- (void)changeNumberOfItem:(NSMutableDictionary *)itemsDict value:(double)value array:(NSMutableArray *)array number:(int)i;

//检查物品过期
- (void)goodsInspection:(NSMutableArray *)array overDueMutArray: (NSMutableArray *)overDueArray;
//处理网络请求下来的数据
- (NSDictionary *)ProcessingNetworkRequestDataOfItems:(NSDictionary *)dict;
//将字符串转为NSDate数据
- (NSDate *)ProcessingDateFromString:(NSString *)string;
//将网络请求下的数据放入本地数据库做缓存
- (void)storeTheItemsIntoDataBase:(NSArray *)array;
//将日期转为字符串
- (NSString *)ProcessionDateToString:(NSDate *)date;
//将数据库中的数据转为数组
- (NSMutableArray *)ExtractDataFromTheLocalDatabase;
//处理数据库中的数据。
- (NSDictionary *)ProcessingDatabaseResult:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
