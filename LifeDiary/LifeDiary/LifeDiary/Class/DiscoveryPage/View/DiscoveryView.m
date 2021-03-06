//
//  DiscoveryView.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DiscoveryView.h"

@implementation DiscoveryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"tianjia.png"];
    [self addSubview:imageView];
    
    
    _webView = [[WKWebView alloc] initWithFrame:self.bounds];//初始化

    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://main.m.taobao.com/index.html"]];

    [_webView loadRequest:request];
    _webView.allowsBackForwardNavigationGestures = YES;
    [self addSubview:_webView];

}
@end
