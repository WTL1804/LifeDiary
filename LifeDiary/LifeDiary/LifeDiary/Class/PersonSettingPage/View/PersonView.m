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
    [_headImageView setFrame:CGRectMake(45, 125, 45, 45)];
    _headImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    _headImageView.layer.shadowOffset = CGSizeMake(0, 0);
    _headImageView.layer.shadowOpacity = 1;
    _headImageView.layer.shadowRadius = 3;
    _headImageView.backgroundColor = [UIColor whiteColor];
    
    _headImageView.clipsToBounds = YES;
    _headImageView.layer.borderWidth = 0.5;
    _headImageView.layer.borderColor = [UIColor blackColor].CGColor;
    _headImageView.layer.cornerRadius = _headImageView.frame.size.width/2;
    [self addSubview:_headImageView];
    
    
    
}
- (void)swipeBack {
    [self.swipeLeftDelegate swipLeft];
}


@end
