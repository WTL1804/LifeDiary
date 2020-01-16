//
//  WelcomeViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WelComeView;
NS_ASSUME_NONNULL_BEGIN

@interface WelcomeViewController : UIViewController
@property (nonatomic, strong) WelComeView *welComeView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) int number;
@end

NS_ASSUME_NONNULL_END
