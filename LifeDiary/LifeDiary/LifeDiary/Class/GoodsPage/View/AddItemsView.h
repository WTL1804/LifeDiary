//
//  AddItemsView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Items.h"
NS_ASSUME_NONNULL_BEGIN
@protocol ClickCamera <NSObject>

- (void)clickCamera;

@end
@interface AddItemsView : UIView <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

- (void)setUI;
@property (nonatomic, strong) UIButton *photoBtn;
@property (nonatomic) CGRect navigationFrame;

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) id <ClickCamera>delegateClickCamera;

@property (nonatomic, strong) UITextField *itemNameTextField;
@property (nonatomic, strong) UITextField *itemNamePropertiesTextField;
@property (nonatomic, strong) UITextField *dateTextField;
@property (nonatomic, strong) UITextField *ShelfLifeTextField;
@property (nonatomic, strong) UITextField *numberTextField;

@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, strong) Items *addItems;

@end

NS_ASSUME_NONNULL_END
