//
//  SearchViewModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/28.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewModel : NSObject
//数据库路径
@property (nonatomic, copy) NSString *doPath;
//打开数据库并搜索关键字返回物品名称
- (NSArray *)searchDataBaseUseingText:(NSString *)text;
//根据物品名字更新view中的resultArray
- (NSMutableArray *)matchingItemsFromNameArray:(NSArray *)nameArray originalArray:(NSMutableArray *)originalMutArray;
@end

NS_ASSUME_NONNULL_END
