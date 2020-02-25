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
    
    
    
    _backGroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [_backGroundImageView setImage:[UIImage imageNamed:@"backGround.jpg"]];
    [self addSubview:_backGroundImageView];
    
    UIImage *image = [UIImage imageNamed:@"head2.jpeg"];
    _headImageView = [[UIImageView alloc] initWithImage:image];
    
    _backGroundImageView.mas_key = @"View1";
    _headImageView.mas_key = @"View2";
    //[_headImageView setFrame:CGRectMake(45, 125, 45, 45)];
//    _headImageView.layer.shadowColor = [UIColor blackColor].CGColor;
//    _headImageView.layer.shadowOffset = CGSizeMake(0, 0);
//    _headImageView.layer.shadowOpacity = 1;
//    _headImageView.layer.shadowRadius = 3;
//    _headImageView.backgroundColor = [UIColor whiteColor];
    
    _headImageView.clipsToBounds = YES;
    _headImageView.layer.borderWidth = 0.5;
    _headImageView.layer.borderColor = [UIColor blackColor].CGColor;
    _headImageView.layer.cornerRadius = 45/2;
     [self addSubview:_headImageView];
    
    _welcomeLabel = [[UILabel alloc] init];
    [self addSubview:_welcomeLabel];
    _welcomeLabel.textColor = [UIColor whiteColor];
    _welcomeLabel.font = [UIFont systemFontOfSize:28];
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH"];
    NSString *string = [formatter stringFromDate:nowDate];
    int timeInt = [string intValue];
    if (timeInt < 11 && timeInt > 6) {
        string = @"Good Moring, Liang";
    } else if (timeInt <= 18) {
        string = @"Good Afternoon, Liang";
    } else {
        string = @"Good Night, Liang";
    }
    _welcomeLabel.text = string;
    
    _describeLabel = [[UILabel alloc] init];
    [self addSubview:_describeLabel];
    _describeLabel.textColor = [UIColor grayColor];
    _describeLabel.font = [UIFont systemFontOfSize:20];
    
    
}
- (void)swipeBack {
    [self.swipeLeftDelegate swipLeft];
}
- (void)layoutSubviews {
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.mas_top).offset(self.frame.size.height/7);
        make.bottom.equalTo(self.mas_top).offset(45 + self.frame.size.height/7);
    make.left.equalTo(self.mas_left).offset(self.frame.size.width/6);
        make.right.equalTo(self.mas_left).offset(45 + self.frame.size.width/6);
    }];
    
    [_welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headImageView.mas_top).offset(self.frame.size.height/15);
        make.bottom.equalTo(_headImageView.mas_top).offset(self.frame.size.height * 2/15);
        make.left.equalTo(_headImageView.mas_left);
        make.right.equalTo(_headImageView.mas_left).offset(self.frame.size.width/2+100);
    }];
}

@end
