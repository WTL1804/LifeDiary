//
//  GoodsHeadView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "GoodsHeadView.h"
@implementation GoodsHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(70, 50, 235, 35)];
    self.searchField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.searchField.layer.borderWidth = 0.1;
    self.searchField.layer.cornerRadius = 5;
    self.searchField.placeholder = @"输入要搜索的物品";
    [self addSubview: self.searchField];
    
    self.personBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_personBtn setFrame:CGRectMake(12, 50, 33, 33)];
    [self addSubview:_personBtn];
    [_personBtn setImage:[UIImage imageNamed:@"person.png"] forState:UIControlStateNormal];
    [_personBtn addTarget:self action:@selector(clickPersonBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.allBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_allBtn setFrame:CGRectMake(320, 50, 33, 33)];
    [self addSubview:_allBtn];
    [_allBtn setImage:[UIImage imageNamed:@"quanbu.png"] forState:UIControlStateNormal];
    [_allBtn addTarget:self action:@selector(clickAllBtn) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickPersonBtn {
    [self.personBtnDelegate clickPersonBtn];
}
- (void)clickAllBtn {
    [self.deleagate clickAllBtn];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchField resignFirstResponder];
}
@end
