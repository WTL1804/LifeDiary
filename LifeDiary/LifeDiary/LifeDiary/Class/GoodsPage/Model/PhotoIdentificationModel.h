//
//  PhotoIdentificationModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/19.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ObjectModel
@end



@interface ObjectModel : JSONModel
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *keyword;
@end


@interface PhotoIdentificationModel : JSONModel
@property (nonatomic, strong) NSArray <ObjectModel> *result;
@end



NS_ASSUME_NONNULL_END
