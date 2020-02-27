//
//  PersonView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/14.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "PersonView.h"
#import <Masonry.h>
#import "ItemsShowsView.h"
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
    _describeLabel.font = [UIFont systemFontOfSize:15];
    string = [NSString stringWithFormat:@"你近期有%ld个物品将要过期，尽快使用吧",_itemsMutArray.count];
    _describeLabel.text = string;
    _describeLabel.numberOfLines = 1;
    
    _describeTempLabel = [[UILabel alloc] init];
    [self addSubview:_describeTempLabel];
    _describeTempLabel.textColor = [UIColor grayColor];
    _describeTempLabel.font = [UIFont systemFontOfSize:15];
    string = @"Looks like feel good";
    _describeTempLabel.text = string;
    _describeTempLabel.numberOfLines = 1;
    
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    for (int i = 0; i < _itemsMutArray.count; i++) {
        ItemsShowsView *itemsView = [[ItemsShowsView alloc] init];
        itemsView.tag = i+500;
        [_scrollView addSubview:itemsView];
        itemsView.backgroundColor = [UIColor whiteColor];
        itemsView.itemsDict = [_itemsMutArray[i] mutableCopy];
        //[itemsView setUI];
    }
    [self layoutIfNeeded];
    _scrollView.contentSize = CGSizeMake(_itemsMutArray.count *(self.frame.size.width * 2/3 + 40) + 10, 0);
    for (int i = 0; i < _itemsMutArray.count; i++) {
        ItemsShowsView *view = [self viewWithTag:500 + i];
        if (i == 0) {
        view.frame = CGRectMake(10, 0, self.frame.size.width *2/3 + 5, _scrollView.frame.size.height - 2);
            view.layer.cornerRadius = 5;
            
            [view setUI];
            continue;
        }
        view.frame = CGRectMake(i * (self.frame.size.width *2/3 + 5) + i * 35 + 10, 0, _scrollView.frame.size.width *2/3, _scrollView.frame.size.height - 2);
        view.layer.cornerRadius = 5;
        [view setUI];
    }
    
    
    _todayLabel = [[UILabel alloc] init];
    [self addSubview:_todayLabel];
    _todayLabel.textColor = [UIColor whiteColor];
    _todayLabel.font = [UIFont systemFontOfSize:18];
     NSDate *now = [NSDate date];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@" yyyy - MM - dd"];
    NSString *nowString = [matter stringFromDate:now];
    NSString *tempString = @"TODAY:";
    tempString = [tempString stringByAppendingString:nowString];
    _todayLabel.text = tempString;
    
    
    
    
    
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
    
    [_describeTempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_welcomeLabel.mas_bottom). offset(-15);
        make.bottom.equalTo(_welcomeLabel.mas_bottom).offset(-15 + self.frame.size.height * 1/20);
        make.left.equalTo(_welcomeLabel.mas_left);
        make.right.equalTo(_welcomeLabel.mas_right);
    }];
    
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_describeTempLabel.mas_bottom).offset(-10);
        make.bottom.equalTo(_describeTempLabel.mas_bottom).offset(-10 + self.frame.size.height * 1/20);
        make.left.equalTo(_welcomeLabel.mas_left);
        make.right.equalTo(_welcomeLabel.mas_right);
    }];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_describeLabel.mas_bottom).offset(self.frame.size.height/10);
        make.bottom.equalTo(self.mas_bottom).offset(-self.frame.size.height/13);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    [_todayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_scrollView.mas_top).offset(-self.frame.size.height/15);
        make.bottom.equalTo(_scrollView.mas_top);
        make.left.equalTo(_describeLabel.mas_left);
        make.right.equalTo(_describeLabel.mas_right);
    }];
    
//    [self layoutIfNeeded];
//    _scrollView.contentSize = CGSizeMake(_itemsMutArray.count *(self.frame.size.width * 2/3 + 45) + 10, 0);
//    for (int i = 0; i < _itemsMutArray.count; i++) {
//        ItemsShowsView *view = [self viewWithTag:500 + i];
//        if (i == 0) {
//        view.frame = CGRectMake(10, 0, self.frame.size.width *2/3 + 5, _scrollView.frame.size.height - 2);
//            view.layer.cornerRadius = 5;
//
//            [view setUI];
//            continue;
//        }
//        view.frame = CGRectMake(i * (self.frame.size.width *2/3 + 5) + i * 40 + 10, 0, _scrollView.frame.size.width *2/3, _scrollView.frame.size.height - 2);
//        view.layer.cornerRadius = 5;
//        [view setUI];
//    }
}


@end
