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
    self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(15, 90, self.frame.size.width - 30, 35)];
    self.searchField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.searchField.layer.borderWidth = 0.1;
    self.searchField.layer.cornerRadius = 5;
    self.searchField.text = @" 输入要搜索的物品";
    self.searchField.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    self.searchField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-2.png"]];
    _searchField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview: self.searchField];
    _searchField.backgroundColor = self.backgroundColor = [UIColor colorWithRed:0.20392 green:0.23137 blue:0.321 alpha:1];
    _searchField.delegate = self;
    
    self.personBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_personBtn setFrame:CGRectMake(12, 40, 33, 33)];
    [self addSubview:_personBtn];
    [_personBtn setImage:[UIImage imageNamed:@"person.png"] forState:UIControlStateNormal];
    [_personBtn addTarget:self action:@selector(clickPersonBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.allBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_allBtn setFrame:CGRectMake(320, 42, 33, 33)];
    [self addSubview:_allBtn];
    [_allBtn setImage:[UIImage imageNamed:@"quanbu.png"] forState:UIControlStateNormal];
    [_allBtn addTarget:self action:@selector(clickAllBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.backgroundColor = [UIColor colorWithRed:0.133333 green:0.1647 blue:0.2549 alpha:1];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 60, 40, 120, 35)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = @"物品首页";
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.titleLabel];
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
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.text = @"";
}
@end
