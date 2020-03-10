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
    
@end

NS_ASSUME_NONNULL_END
