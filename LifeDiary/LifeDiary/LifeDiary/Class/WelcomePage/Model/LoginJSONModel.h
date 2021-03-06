//
//  LoginJSONModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DataJSONModel
@end

@interface DataJSONModel : JSONModel
@property (nonatomic, copy) NSString *ID;
@end



@interface LoginJSONModel : JSONModel
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) DataJSONModel *data;
@end

NS_ASSUME_NONNULL_END
