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
@class RegisterJSONModel;
@class LoginJSONModel;
@class ItemsGoodsViewModel;
@class Items;
@class UploadImageModel;
NS_ASSUME_NONNULL_BEGIN
typedef void (^AccessTokenHandle)(Access_tokenModel *accessTokenModel);
typedef void(^ErrorHandle)(NSError *error);
typedef void (^PhotoIdentificationHandle)(PhotoIdentificationModel *identificationModel);
typedef void (^RegisterHandle)(RegisterJSONModel *registerJSONModel);
typedef void (^LoginHandle)(LoginJSONModel *loginJSONModel);
typedef void (^ItemsRequestHandle)(NSDictionary *dict);
typedef void (^UploadImageHandle)(UploadImageModel *uploadModel);
typedef void (^AcquireHeadImageHandle)(NSDictionary *dict);
typedef void (^ALLItemsListHandle)(ItemsGoodsViewModel *itemsListViewModel);
typedef void (^DeletFifhteenHandle)(NSDictionary *dict);
@interface LifeDiaryManage : NSObject

//获取百度ai开放能力的key
- (void)toOtainAccess_token:(AccessTokenHandle)successBlock error:(ErrorHandle)errorBlock;

+ (instancetype)sharedLeton;

//百度通用物体识别
- (void)identification:(PhotoIdentificationHandle)successBlock error:(ErrorHandle)errorBlock;

//注册请求
- (void)regisetUserToBackGroundWithUser:(NSString *)username pass:(NSString *)password success:(RegisterHandle)successBlock error:(ErrorHandle)errorBlock;

//登录请求
- (void)loginUserToBackGroundWithUser:(NSString *)username pass:(NSString *)password success:(LoginHandle)successBlock error:(ErrorHandle)errorBlock;

//请求存储物品
- (void)itemsStoredWithUserID:(NSString *)ID JSESSION:(NSString *)jsession Items:(Items *)items success:(ItemsRequestHandle)successBlock error:(ErrorHandle)errorBlock;

//上传图片
- (void)uploadImageWithImageData:(NSData *)imageData JSESSIONID:(NSString *)jseesionID success:(UploadImageHandle)successBlock error: (ErrorHandle)errorBlock;
//获取登录cookie.value
- (NSString *)ObtaionCookie;


//获取头像图片
- (void)acquireHeadImageWithUserID:(NSString *)ID success:(AcquireHeadImageHandle)successBlock error:(ErrorHandle)errorBlock;
//请求全部物品
- (void)itemsAllWithJsession:(NSString *)jsession success:(ALLItemsListHandle)successBlock error:(ErrorHandle)errorBlock;
//删除过期15天的物品
- (void)DeleteItemsThatAreFifteenDaysOldWithMutArray:(NSMutableArray *)array success:(DeletFifhteenHandle)successBlock error:(ErrorHandle)errorBlock;

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *image;

@end

NS_ASSUME_NONNULL_END
