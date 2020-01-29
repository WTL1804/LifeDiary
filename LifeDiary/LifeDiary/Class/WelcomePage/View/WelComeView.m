//
//  WelComeView.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "WelComeView.h"
#import <Masonry.h>
@implementation WelComeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    _welcomeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome.png"]];
    [self addSubview:_welcomeImageView];
}
- (void)layoutSubviews{
    [_welcomeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
       // make.edges.mas_offset(UIEdgeInsetsMake(50, 80, 450, 80));
//        make.edges.mas_equalTo(CGSizeMake(100, 100));
       
    }];
}

@end
