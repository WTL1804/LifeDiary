//
//  RegisterView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RegisterUserDelegate <NSObject>

- (void)registerUser:(NSArray *)array;

@end
@interface RegisterView : UIView
@property (nonatomic, strong) UIButton *headImageButton;
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passTextField;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, weak) id <RegisterUserDelegate> RegiserDelegate;


- (void)setUI;

@end

NS_ASSUME_NONNULL_END
