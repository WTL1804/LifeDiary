//
//  SearchView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/27.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setUI {
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 88)];
    [self addSubview:_headView];
    
    self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(15, 35, self.frame.size.width - 30, 35)];
    self.searchField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.searchField.layer.borderWidth = 0.1;
    self.searchField.layer.cornerRadius = 5;
    self.searchField.text = @" 输入要搜索的物品";
    self.searchField.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    self.searchField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-2.png"]];
    _searchField.leftViewMode = UITextFieldViewModeAlways;
    [_headView addSubview: self.searchField];
    _searchField.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    _searchField.delegate = self;
    _searchField.keyboardType = UIKeyboardTypeDefault;
    
}

@end
