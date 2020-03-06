//
//  LifeDiaryManage.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/19.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "LifeDiaryManage.h"
#import "Access_tokenModel.h"
#import <AFNetworking.h>
#import "PhotoIdentificationModel.h"
#import "RegisterJSONModel.h"
#import "LoginJSONModel.h"
#import "itemsGoodsViewModel.h"
#import "Items.h"
static LifeDiaryManage *manageCustom;
@implementation LifeDiaryManage
+ (instancetype) sharedLeton {
    if (! manageCustom) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manageCustom = [LifeDiaryManage new];
        });
    }
    return manageCustom;
}
- (void)toOtainAccess_token:(AccessTokenHandle)successBlock error:(ErrorHandle)errorBlock {
    //请求样例
    //grant_type=client_credentials 为默认
    //client_id = DZKMuYbEzbLAdmvtuO014Snv
    //client_secret = UFPp5uyWMsd7NYwsetGoQuEpPKy4LMzA
//https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=Va5yQRHlA4Fq5eR3LT0vuXV4&client_secret=0rDSjzQ20XUj5itV6WRtznPQSzr5pVw2&
    NSString *id = @"DZKMuYbEzbLAdmvtuO014Snv";
    NSString *secret = @"UFPp5uyWMsd7NYwsetGoQuEpPKy4LMzA";
    NSString *requestString = [NSString stringWithFormat:@"https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=%@&client_secret=%@", id, secret];
    NSURL *url  = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            Access_tokenModel *accessModel = [[Access_tokenModel alloc] initWithDictionary:dict error:&err];
            successBlock(accessModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
- (void)identification:(PhotoIdentificationHandle)successBlock error:(ErrorHandle)errorBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{@"access_token":self.access_token, @"Content-Type":@"application/x-www-form-urlencoded",@"image":self.image};
    [manager POST:@"https://aip.baidubce.com/rest/2.0/image-classify/v2/advanced_general" parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PhotoIdentificationModel *identification = [[PhotoIdentificationModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(identification);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
        
}

- (void)regisetUserToBackGroundWithUser:(NSString *)username pass:(NSString *)password success:(RegisterHandle)successBlock error:(ErrorHandle)errorBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{@"username":username,@"password":password, @"Content-Type":@"application/x-www-form-urlencoded"};
    NSString *url =@"http://116.62.179.174:8080/mmall/user/register.do";
    [manager POST:url parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        RegisterJSONModel *registerJSONModel = [[RegisterJSONModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(registerJSONModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}
- (void)loginUserToBackGroundWithUser:(NSString *)username pass:(NSString *)password success:(LoginHandle)successBlock error:(ErrorHandle)errorBlock {
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    NSDictionary *dict = @{@"username":username, @"password":password};
    NSString *url = @"http://116.62.179.174:8080/mmall/user/login.do";
    [manage POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LoginJSONModel *loginJSONModel = [[LoginJSONModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(loginJSONModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
}

- (void)itemsStoredAllWithUserID:(NSString *)ID Items:(Items *)items success:(itemsRequestHandle)successBlock error:(ErrorHandle)errorBlock{
        AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
      //  NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSDateFormatter *matter = [[NSDateFormatter alloc] init];
            [matter setDateFormat:@"yyyy-MM-dd"];
//            NSString *nowString = [matter stringFromDate:now];
//     NSString *imageBase64 = [items.imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSString *imageBaseUTF8 = [[NSString alloc] initWithData:items.imageData encoding:NSUTF8StringEncoding];
    NSDictionary *paramDict = @{@"id":ID, @"proname":items.name, @"production_date":[matter stringFromDate:items.productionDate], @"expiration_date":[matter stringFromDate:items.overDue], @"exptime":[items.shelfLifeNumber stringValue], @"add_date":items.addDate, @"product_image":imageBaseUTF8, @"sign":items.itemsState, @"property":items.attribute, @"detail":items.describeString};
        NSString *url = @"";
        [manage POST:url parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ItemsGoodsViewModel *itemsGoodsViewModel = [[ItemsGoodsViewModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(itemsGoodsViewModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    //NSLog(@"change:%@", change);
    if ([keyPath  isEqual: @"access_token"]) {
        self.access_token = [[change valueForKey:@"new"] mutableCopy];
    } else {
        self.image = [change valueForKey:@"new"];
    }
}
@end
