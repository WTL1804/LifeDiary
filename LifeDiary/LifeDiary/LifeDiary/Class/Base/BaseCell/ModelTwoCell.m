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
#import "UIBezierPath+GetAllPoints.h"
@implementation ModelTwoCell

- (void)setLayOutInSubclass:(BaseModel *)baseModel {
    _modelTwo = (ModelTwo *)baseModel;
    if (!_imageViewOfItems) {
    _imageViewOfItems = [[UIImageView alloc] initWithImage:[UIImage imageWithData:_modelTwo.imageData]];
      
    _imageViewOfItems.layer.masksToBounds = YES;
    _imageViewOfItems.layer.cornerRadius = 30;
    }
    [self addSubview:_imageViewOfItems];

    if(!_deadLineLabel) {
        _deadLineLabel = [[UILabel alloc] init];
        NSString *stringDate = @"剩余:";
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:_modelTwo.overDue options:NSCalendarWrapComponents];
    
        NSNumber *number = [NSNumber numberWithInteger:comp.day];
       stringDate = [stringDate stringByAppendingString:[number stringValue]];
        stringDate = [stringDate stringByAppendingString:@"天"];
       _deadLineLabel.text = stringDate;
        [_deadLineLabel setTextAlignment:NSTextAlignmentLeft];
    }
    [self addSubview:_deadLineLabel];
    
    if (!_numberOfItemLabel) {
        _numberOfItemLabel = [[UILabel alloc] init];
       
        NSString *numberString = @"数量：";
        numberString = [numberString stringByAppendingString:[_modelTwo.numberOfItem stringValue]];
        _numberOfItemLabel.text = numberString;
    }
     [self addSubview:_numberOfItemLabel];
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = _modelTwo.name;
    }
    [self addSubview:_titleLabel];
    
    if (!_attributeLabel) {
        _attributeLabel = [[UILabel alloc] init];
        _attributeLabel.text = _modelTwo.attribute;
    }
    [self addSubview:_attributeLabel];
    
    if (!_increaseStepper) {
        _increaseStepper = [[UIStepper alloc] init];
        _increaseStepper.maximumValue = 999;
        _increaseStepper.minimumValue = 0;
        _increaseStepper.value = [_modelTwo.numberOfItem doubleValue];
        [_increaseStepper addTarget:self action:@selector(numberChange:) forControlEvents:UIControlEventValueChanged];
    }
    [self addSubview:_increaseStepper];
  
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
      shapeLayer.frame = CGRectMake(320, 380, 30, 30);
      shapeLayer.fillColor = [UIColor whiteColor].CGColor;
      shapeLayer.lineWidth = 1.0f;
      shapeLayer.strokeColor = [UIColor redColor].CGColor;
      UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 30, 30)];
      shapeLayer.path = path.CGPath;
      [self.layer addSublayer:shapeLayer];
      
       CAShapeLayer * _shapeLayer = [CAShapeLayer layer];
          _shapeLayer.frame = CGRectMake(320, 380, 30, 30);
          _shapeLayer.fillColor = [UIColor greenColor].CGColor;
          _shapeLayer.lineWidth = 1.0f;
          _shapeLayer.strokeColor = [UIColor redColor].CGColor;
      //剩余天数
          NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
          NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:_modelTwo.overDue options:NSCalendarWrapComponents];
          NSNumber *number = [NSNumber numberWithInteger:comp.day];
          CGFloat percentage = [number doubleValue] / [_modelTwo.shelfLifeNumber doubleValue];
          UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(15, 15) radius:15 startAngle:((270-180*(1-percentage))/180)*3.1415926 endAngle:((270+180*(1-percentage))/180)*3.1415926 clockwise:NO];
          NSLog(@"%f",((270-270*(percentage))/180));
         [bezierPath moveToPoint:bezierPath.currentPoint];

          bezierPath.lineCapStyle  = kCGLineCapRound;
          bezierPath.lineJoinStyle = kCGLineCapRound;
          NSArray * pointArray =  [bezierPath points];
          CGPoint tempPoint =[pointArray[0] CGPointValue];
          [bezierPath addLineToPoint:tempPoint];
          _shapeLayer.path = bezierPath.CGPath;
      
          [self.layer addSublayer:_shapeLayer];

}
- (void)numberChange:(UIStepper *)sc{
    _modelTwo.numberOfItem = [NSNumber numberWithDouble:sc.value];
    NSNumber *number = [NSNumber numberWithDouble:sc.value];
    NSString *numberString = @"数量：";
           numberString = [numberString stringByAppendingString:[number stringValue]];
           _numberOfItemLabel.text = numberString;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjects:@[_modelTwo.name,sc] forKeys:@[@"name", @"stepper"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"numberChange" object:self userInfo:dict];
    
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
        make.top.equalTo(_titleLabel.mas_bottom).offset(-5);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 8/9);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    [_deadLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageViewOfItems.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_left).offset(120);
    }];
    
    [_attributeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(_titleLabel.mas_bottom);
        make.left.equalTo(self.mas_right).offset(-100);
        make.right.equalTo(self.mas_right);
    }];
    
    [_numberOfItemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(_imageViewOfItems.mas_bottom).offset(10);
       make.bottom.equalTo(self.mas_bottom).offset(-10);
       make.left.equalTo(_deadLineLabel.mas_right);
       make.right.equalTo(_deadLineLabel.mas_right).offset(90);
    }];
    
    [_increaseStepper mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(_imageViewOfItems.mas_bottom).offset(10);
       make.bottom.equalTo(self.mas_bottom).offset(-10);
       make.left.equalTo(_numberOfItemLabel.mas_right);
       make.right.equalTo(_numberOfItemLabel.mas_right).offset(100);
    }];
}

@end
