//
//  PersonSettingViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersonView;
@class PersonSettingModel;
NS_ASSUME_NONNULL_BEGIN

@interface PersonSettingViewController : UIViewController
@property (nonatomic, strong) PersonView *mainView;
@property (nonatomic, strong) NSMutableArray *itemsMutArray;

@property (nonatomic, strong) PersonSettingModel *personModel;

@end

NS_ASSUME_NONNULL_END
