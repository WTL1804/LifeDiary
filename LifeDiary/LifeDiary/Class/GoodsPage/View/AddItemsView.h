//
//  AddItemsView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ClickCamera <NSObject>

- (void)clickCamera;

@end
@interface AddItemsView : UIView <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (void)setUI;

@property (nonatomic, strong) UIButton *photoBtn;
@property (nonatomic) CGRect navigationFrame;

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) id <ClickCamera>delegateClickCamera;
@end

NS_ASSUME_NONNULL_END
