//
//  UploadImageModel.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/9.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DataModel
@end

@interface DataModel : JSONModel
@property (nonatomic, copy) NSString *uri;
@property (nonatomic, strong) NSString *url;
@end

@interface UploadImageModel : JSONModel
@property (nonatomic, copy) DataModel *data;
@end

NS_ASSUME_NONNULL_END
