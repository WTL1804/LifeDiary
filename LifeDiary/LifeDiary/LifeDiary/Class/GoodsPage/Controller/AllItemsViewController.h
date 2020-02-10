//
//  AllItemsViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/8.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class AllItemsView;
@interface AllItemsViewController : UIViewController

@property (nonatomic, strong) UIBarButtonItem *leftBarButton;

@property (nonatomic, strong) AllItemsView *allView;

@property (nonatomic, strong) NSMutableArray *itemsTempMutArray;
@end

NS_ASSUME_NONNULL_END
