//
//  PersonView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "PersonView.h"
#import <Masonry.h>
@implementation PersonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    _backRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeBack)];
    [_backRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self  addGestureRecognizer:_backRecognizer];
    
    _topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backGround.jpeg"]];
    _topImageView.clipsToBounds = YES;
    [self addSubview:_topImageView];
    
    _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head.png"]];
    _headImageView.clipsToBounds = YES;
    _headImageView.layer.borderWidth = 0.5;
    _headImageView.layer.borderColor = [UIColor blackColor].CGColor;
    _headImageView.layer.cornerRadius = _headImageView.frame.size.width/2;
    [self addSubview:_headImageView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.frame.size.height* (1-0.618), self.frame.size.width, self.frame.size.height - self.frame.size.height* (1-0.618)) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
}
- (void)swipeBack {
    [self.swipeLeftDelegate swipLeft];
}
- (void)layoutSubviews {
    [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height* (1-0.618));
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.frame.size.height * (1 - 0.618) - 100);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * (1-0.618) - 35);
        make.left.equalTo(self.mas_left).offset(35);
        make.right.equalTo(self.mas_left).offset(100);
    }];
    
}

@end
