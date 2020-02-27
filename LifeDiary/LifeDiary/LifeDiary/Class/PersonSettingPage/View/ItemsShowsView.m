//
//  itemsShowsView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/26.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "ItemsShowsView.h"
#import <Masonry.h>
@implementation ItemsShowsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    
    _itemsImageView = [[UIImageView alloc] init];
    UIImage *tempImage = [UIImage imageWithData:[_itemsDict valueForKey:@"imageData"]];
    [_itemsImageView setImage:tempImage];
    [self addSubview:_itemsImageView];
    _itemsImageView.mas_key = @"123View";
    _itemsImageView.layer.cornerRadius = 15;
    _itemsImageView.clipsToBounds = YES;
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview: _nameLabel];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont systemFontOfSize:25 weight:1];
    _nameLabel.text = [_itemsDict valueForKey:@"name"];
    
    _numberLabel = [[UILabel alloc] init];
    [self addSubview: _numberLabel];
    _numberLabel.textColor = [UIColor grayColor];
    _numberLabel.font = [UIFont systemFontOfSize:15];
    NSString *numberString = [[_itemsDict valueForKey:@"numberOfItem"] stringValue];
    numberString = [numberString stringByAppendingString:@" Items"];
    _numberLabel.text = numberString;
    
    
    _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self addSubview:_progressView];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:[_itemsDict valueForKey:@"overDue"] options:NSCalendarWrapComponents];
        NSNumber *number = [NSNumber numberWithInteger:comp.day];
    double  percent = [number doubleValue] / [[_itemsDict valueForKey:@"shelfLifeNumber"] doubleValue] ;
    _progressView.progress = percent;
    [_progressView setFrame:CGRectMake(20, self.frame.size.height - 35, self.frame.size.width - 70, 40)];
    
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, self.frame.size.height - 45, 30, 20)];
    [self addSubview:tempLabel];
    tempLabel.font = [UIFont systemFontOfSize:10];
    tempLabel.textColor = [UIColor grayColor];
    NSString *percentString = [NSString stringWithFormat:@" %d %%", (int)(percent*100)];
    tempLabel.text = percentString;
  
}
- (void)layoutSubviews {
    [_itemsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.frame.size.height * 1.5 /8);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 5.5/ 8);
        make.left.equalTo(self.mas_left).offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_itemsImageView.mas_bottom).offset(10);
        make.bottom.equalTo(_itemsImageView.mas_bottom).offset(10 + self.frame.size.height/16);
        make.left.equalTo(_itemsImageView.mas_left).offset(15);
        make.right.equalTo(_itemsImageView.mas_right);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_numberLabel.mas_bottom);
        make.bottom.equalTo(_numberLabel.mas_bottom).offset(self.frame.size.height * 1.5 / 16);
        make.left.equalTo(_numberLabel.mas_left);
        make.right.equalTo(_numberLabel.mas_right);
    }];
    
}
@end
