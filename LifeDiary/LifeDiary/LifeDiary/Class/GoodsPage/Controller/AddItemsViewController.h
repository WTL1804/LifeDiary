//
//  AddItemsViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemsView.h"
NS_ASSUME_NONNULL_BEGIN

@protocol addItemDelegate <NSObject>

- (void)passItem:(Items *)items;

@end
@interface AddItemsViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong)AddItemsView * addItemsView;

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, weak) id <addItemDelegate> delegateItems;
@end

NS_ASSUME_NONNULL_END
