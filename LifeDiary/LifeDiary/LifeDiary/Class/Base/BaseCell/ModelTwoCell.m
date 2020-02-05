//
//  ModelTwoCell.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "ModelTwoCell.h"
#import "ModelTwo.h"
#import <Masonry.h>
@implementation ModelTwoCell

- (void)setLayOutInSubclass:(BaseModel *)baseModel {
    _modelTwo = (ModelTwo *)baseModel;
    
    _imageViewOfItems = [[UIImageView alloc] initWithImage:[UIImage imageWithData:_modelTwo.imageData]];
       [self addSubview:_imageViewOfItems];
       
       _deadLineLabel = [[UILabel alloc] init];
        NSString *stringDate = @"剩余天数:";
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:_modelTwo.overDue options:NSCalendarWrapComponents];
    
    NSNumber *number = [NSNumber numberWithInteger:comp.day];
       stringDate = [stringDate stringByAppendingString:[number stringValue]];
       _deadLineLabel.text = stringDate;
       [self addSubview:_deadLineLabel];
    
    _numberOfItemLabel = [[UILabel alloc] init];
    [self addSubview:_numberOfItemLabel];
    NSString *numberString = @"数量：";
    numberString = [numberString stringByAppendingString:[_modelTwo.numberOfItem stringValue]];
    _numberOfItemLabel.text = numberString;
    
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _modelTwo.name;
    [self addSubview:_titleLabel];
    
    _attributeLabel = [[UILabel alloc] init];
    _attributeLabel.text = _modelTwo.attribute;
    [self addSubview:_attributeLabel];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height/9);
        make.left.equalTo(self.mas_left).offset(13);
        make.right.equalTo(self.mas_left).offset(200);
        
    }];
    
    [_imageViewOfItems mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 7.5/9);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
}

@end
