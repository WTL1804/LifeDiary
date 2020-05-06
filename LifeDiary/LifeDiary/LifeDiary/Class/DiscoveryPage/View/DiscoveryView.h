//
//  DiscoveryView.h
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DiscoveryView : UIView

@property (nonatomic, strong) WKWebView *webView;

- (void)setUI;

@end

NS_ASSUME_NONNULL_END
