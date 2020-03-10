//
//  AdditemsModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/9.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditemsModel : NSObject

//检查物品name重复
- (BOOL)goodsNameRechecking:(NSString *)itemName itemsArray:(NSArray *)array;

@end


NS_ASSUME_NONNULL_END
