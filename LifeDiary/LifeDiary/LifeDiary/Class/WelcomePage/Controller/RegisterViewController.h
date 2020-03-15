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

@interface RegisterViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) RegisterView *registerView;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@property (nonatomic, copy) void (^returnUserName)(NSString *userName, UIImage *image);
@end


NS_ASSUME_NONNULL_END
