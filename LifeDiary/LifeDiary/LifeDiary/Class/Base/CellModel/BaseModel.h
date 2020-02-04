//
//  CellBaseModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject


+ (instancetype)initWithDictionary:(NSDictionary *) dictionary;

//- (void)setValueForModelSubclass;

@end

NS_ASSUME_NONNULL_END
