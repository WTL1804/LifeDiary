//
//  AddItemsView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "AddItemsView.h"
#import <Masonry.h>
@implementation AddItemsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    
    _photoBtn = [[UIButton alloc] init];
    _photoBtn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self addSubview:_photoBtn];
    [_photoBtn setTitle:@"照片" forState:UIControlStateNormal];
    [_photoBtn setImage:[UIImage imageNamed:@"照相机.png"] forState:UIControlStateNormal];
    [_photoBtn setTitleEdgeInsets:UIEdgeInsetsMake(55, -24, 0, 42)];
    [_photoBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [_photoBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)layoutSubviews {
  
    [_photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height/5);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/3.5);
    }];
}
- (void)clickBtn {
    [self.delegateClickCamera clickCamera];
}
@end
