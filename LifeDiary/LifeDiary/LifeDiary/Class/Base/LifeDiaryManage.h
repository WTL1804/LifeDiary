//
//  LifeDiaryManage.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/19.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Access_tokenModel;
@class PhotoIdentificationModel;
NS_ASSUME_NONNULL_BEGIN
typedef void (^AccessTokenHandle)(Access_tokenModel * accessTokenModel);
typedef void(^ErrorHandle)(NSError *error);
typedef void (^PhotoIdentificationHandle)(PhotoIdentificationModel *identificationModel);
@interface LifeDiaryManage : NSObject

//获取百度ai开放能力的key
- (void)toOtainAccess_token:(AccessTokenHandle)successBlock error:(ErrorHandle)errorBlock;

+ (instancetype)sharedLeton;

//百度通用物体识别
- (void)identification:(PhotoIdentificationHandle)successBlock error:(ErrorHandle)errorBlock;


@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *image;
@end

NS_ASSUME_NONNULL_END
