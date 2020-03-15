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
#import "UploadImageModel.h"
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
    NSString *url = @"http://116.62.179.174:8080/whpro/user/register.do";
    [manager POST:url parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        RegisterJSONModel *registerJSONModel = [[RegisterJSONModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(registerJSONModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}
- (void)loginUserToBackGroundWithUser:(NSString *)username pass:(NSString *)password success:(LoginHandle)successBlock error:(ErrorHandle)errorBlock {
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    NSDictionary *dict = @{@"username":username, @"password":password};
    NSString *url = @"http://116.62.179.174:8080/whpro/user/login.do";
    [manage POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LoginJSONModel *loginJSONModel = [[LoginJSONModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(loginJSONModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
}

- (void)itemsStoredWithUserID:(NSString *)ID Items:(Items *)items success:(itemsRequestHandle)successBlock error:(ErrorHandle)errorBlock{
        AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
        NSDateFormatter *matter = [[NSDateFormatter alloc] init];
            [matter setDateFormat:@"yyyy-MM-dd"];
    NSDictionary *paramDict = @{@"id":ID, @"proname":items.name, @"production_date":[matter stringFromDate:items.productionDate], @"expiration_date":[matter stringFromDate:items.overDue], @"exptime":[items.shelfLifeNumber stringValue], @"add_date":items.addDate, @"sign":items.itemsState, @"property":items.attribute, @"detail":items.describeString};
        NSString *url = @"";
    
        [manage POST:url parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ItemsGoodsViewModel *itemsGoodsViewModel = [[ItemsGoodsViewModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(itemsGoodsViewModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
    
}
- (NSString *)ObtaionCookie {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString: @"http://116.62.179.174:8080/whpro/user/login.do"]];
    NSString *JSESSIONID=@"";
    for (NSHTTPCookie *cookie in cookiesArray) {
        if ([cookie.name isEqualToString:@"JSESSIONID"]) {
                JSESSIONID = cookie.value;
                break;
        }
    }
    return JSESSIONID;
//    [defaults setObject:JSESSIONID forKey:@"data"];
//    [defaults synchronize];
}
- (void)loginToObtaionCookie {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
      //二次登录获取cookie
      //登录方法
      
      [self loginUserToBackGroundWithUser:[defaults valueForKey:@"userName"] pass:[defaults valueForKey:@"passWord"] success:^(LoginJSONModel * _Nonnull loginJSONModel) {
         if ([defaults objectForKey:@"userName"] && ![defaults objectForKey:@"data"]) {
             NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString: @"http://116.62.179.174:8080/whpro/user/login.do"]];
             NSString *JSESSIONID=@"";
             for (NSHTTPCookie *cookie in cookiesArray) {
                 if ([cookie.name isEqualToString:@"JSESSIONID"]) {
                         JSESSIONID = cookie.value;
                         break;
                 }
             }
             [defaults setObject:JSESSIONID forKey:@"data"];
             [defaults synchronize];
         }
          NSLog(@"二次登录获取cookie");
      } error:^(NSError * _Nonnull error) {
          NSLog(@"二次登录失败");
      }];
}
- (void)uploadImageWithImageData:(NSData *)imageData JSESSIONID:(NSString *)jseesionID success:(uploadImageHandle)successBlock error:(ErrorHandle)errorBlock{
    
     AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json", @"text/javascript,multipart/form-data",nil];
    [manage.requestSerializer setValue:jseesionID forHTTPHeaderField:@"Cookie"];
    NSDictionary *paramDict = @{};
    NSString *url = @"http://116.62.179.174:8080/whpro/user/upload.do";
     //[manage.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    manage.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manage POST:url parameters:paramDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
           // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
           // 要解决此问题，
           // 可以在上传时使用当前的系统事件作为文件名
           NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
           // 设置时间格式
           [formatter setDateFormat:@"yyyyMMddHHmm"];
           NSString *dateString = [formatter stringFromDate:[NSDate date]];
           NSString *fileName = [NSString  stringWithFormat:@"%@.png", dateString];
           /*
            *该方法的参数
            1. appendPartWithFileData：要上传的照片[二进制流]
            2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
            3. fileName：要保存在服务器上的文件名
            4. mimeType：上传的文件的类型
            */
           [formData appendPartWithFileData:imageData name:@"upload_file" fileName:fileName mimeType:@"image/png"];

    } progress:^(NSProgress * _Nonnull uploadProgress) {
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           UploadImageModel *upLoadModel = [[UploadImageModel alloc] initWithData:responseObject error:nil];
           successBlock(upLoadModel);
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           errorBlock(error);
       }];

    
    
    
//    NSString *UploadImageBoundary = @"dadajdlajkcalkjkal";
//    NSString *URLString = @"http://116.62.179.174:8080/whpro/user/upload.do";
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
//        [request setHTTPMethod:@"POST"];
//        [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
//        [request setTimeoutInterval:20];
//        NSString* headerString = [NSString stringWithFormat:@"multipart/form-data; charset=utf-8; boundary=%@",UploadImageBoundary];
//        [request setValue:headerString forHTTPHeaderField:@"Content-Type"];
//
//        NSMutableData* requestMutableData = [NSMutableData data];
//        NSMutableString* myString = [NSMutableString stringWithFormat:@"--%@\r\n",UploadImageBoundary];
//        [myString appendString:@"Content-Disposition: form-data; name=\"upload_file\"\r\n\r\n"];/*这里要打两个回车*/
//        [myString appendString:@"100118"];
//        [myString appendString:[NSString stringWithFormat:@"\r\n--%@\r\n",UploadImageBoundary]];
//        [myString appendString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"upload_file\"; filename=\"%@\"\r\n",@"tempName"]];
//        [myString appendString:@"Content-Type: image/jpeg\r\n\r\n"];
//        /*转化为二进制数据*/
//        [requestMutableData appendData:[myString dataUsingEncoding:NSUTF8StringEncoding]];
//        /*文件数据部分，也是二进制*/
//        [requestMutableData appendData:items.imageData];
//        /*已--boundary结尾表明结束*/
//        [requestMutableData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",UploadImageBoundary] dataUsingEncoding:NSUTF8StringEncoding] ];
//
//        request.HTTPBody = requestMutableData;
//        NSURLSession* session  = [NSURLSession sharedSession];
//            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                if (error != nil) {
//                    errorBlock(error);
//                } else {
//                    NSError *errorTemp = [[NSError alloc] init];
//                    UploadImageModel *upload = [[UploadImageModel alloc] initWithData:data error:&errorTemp];
//                    NSLog(@"errorTemp:%@", errorTemp);
//                    successBlock(upload);
//                }
//
//            }];
//
//
//        [dataTask resume];

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
