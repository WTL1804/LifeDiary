//
//  LoginView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LoginDelegate <NSObject>

- (void)login:(NSArray *)array;

@end

@protocol RegisterDelegate <NSObject>

- (void)registerApp;

@end

@interface LoginView : UIView
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, weak) id <LoginDelegate> loginDelegate;
@property (nonatomic, weak) id <RegisterDelegate> registerDelegate;

- (void)setUI;

@end

NS_ASSUME_NONNULL_END
