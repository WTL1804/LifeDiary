//
//  ModelOneCell.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "ModelOneCell.h"
#import "ModelOne.h"
#import <Masonry.h>
@implementation ModelOneCell

- (void)setLayOutInSubclass:(BaseModel *)baseModel {
     _modelOne = (ModelOne *)baseModel;
    
    _imageViewOfItems = [[UIImageView alloc] initWithImage:[UIImage imageWithData:_modelOne.imageData]];
    [self addSubview:_imageViewOfItems];
    
    _deadLineLabel = [[UILabel alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [dateFormatter stringFromDate:_modelOne.overDue];
     NSString *stringDate = @"截止日期";
    stringDate = [stringDate stringByAppendingString:date];
    _deadLineLabel.text = stringDate;
    [self addSubview:_deadLineLabel];
    
    _addDateLabel = [[UILabel alloc] init];
    stringDate = @"添加日期";
    date = [dateFormatter stringFromDate:_modelOne.addDate];
    stringDate = [stringDate stringByAppendingString:date];
    _addDateLabel.text = stringDate;
    [self addSubview:_addDateLabel];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _modelOne.name;
    [self addSubview:_titleLabel];
    
    _attributeLabel = [[UILabel alloc] init];
    _attributeLabel.text = _modelOne.attribute;
    [self addSubview:_attributeLabel];
    
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%lf,%lf",self.frame.size.width, self.frame.size.height);
    [_imageViewOfItems mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.left.equalTo(self.mas_left).offset(5);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/2.5);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height/4);
        make.left.equalTo(_imageViewOfItems.mas_right).offset(10);
        make.right.equalTo(self.mas_right);
    }];
    
    [_attributeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.bottom.equalTo(_titleLabel.mas_bottom).offset(self.frame.size.height/5);
        make.left.equalTo(_imageViewOfItems.mas_right).offset(10);
               make.right.equalTo(self.mas_right);
        
    }];
    [_addDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_attributeLabel.mas_bottom).offset(5);
              make.bottom.equalTo(_attributeLabel.mas_bottom).offset(self.frame.size.height/5);
              make.left.equalTo(_imageViewOfItems.mas_right).offset(10);
                     make.right.equalTo(self.mas_right);
    }];
    [_deadLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_addDateLabel.mas_bottom).offset(5);
                     make.bottom.equalTo(_addDateLabel.mas_bottom).offset(self.frame.size.height/5);
                     make.left.equalTo(_imageViewOfItems.mas_right).offset(10);
                            make.right.equalTo(self.mas_right);
    }];
    
}

@end
