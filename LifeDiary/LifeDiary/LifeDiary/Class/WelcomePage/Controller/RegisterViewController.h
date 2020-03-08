//
//  RegisterViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisterView;
NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController

@property (nonatomic, strong) RegisterView *registerView;

@property (nonatomic, copy) void (^returnUserName)(NSString *userName);
@end


NS_ASSUME_NONNULL_END
