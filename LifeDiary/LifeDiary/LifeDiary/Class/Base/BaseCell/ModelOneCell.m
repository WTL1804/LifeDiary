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
#import "UIBezierPath+GetAllPoints.h"
@implementation ModelOneCell

- (void)setLayOutInSubclass:(BaseModel *)baseModel {
     _modelOne = (ModelOne *)baseModel;
    
    _imageViewOfItems = [[UIImageView alloc] initWithImage:[UIImage imageWithData:_modelOne.imageData]];
    _imageViewOfItems.layer.cornerRadius = 5;
    _imageViewOfItems.layer.masksToBounds = YES;
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
    
    //绘制贝塞尔曲线
//    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
//    shapeLayer.frame = CGRectMake(300, 45, 40, 40);
//    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
//    shapeLayer.lineWidth = 1.0f;
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 40, 40)];
//    shapeLayer.path = path.CGPath;
//    [self.layer addSublayer:shapeLayer];
//
//     CAShapeLayer * _shapeLayer = [CAShapeLayer layer];
//        _shapeLayer.frame = CGRectMake(300, 45, 40, 40);
//        _shapeLayer.fillColor = [UIColor greenColor].CGColor;
//        _shapeLayer.lineWidth = 1.0f;
//        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    //剩余天数
//        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:_modelOne.overDue options:NSCalendarWrapComponents];
//        NSNumber *number = [NSNumber numberWithInteger:comp.day];
//        CGFloat percentage = [number doubleValue] / [_modelOne.shelfLifeNumber doubleValue];
//        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(20, 20) radius:20 startAngle:((270-180*(1-percentage))/180)*3.1415926 endAngle:((270+180*(1-percentage))/180)*3.1415926 clockwise:NO];
//       // NSLog(@"%f",((270-270*(percentage))/180));
//       [bezierPath moveToPoint:bezierPath.currentPoint];
//
//        bezierPath.lineCapStyle  = kCGLineCapRound;
//        bezierPath.lineJoinStyle = kCGLineCapRound;
//        NSArray * pointArray =  [bezierPath points];
//        CGPoint tempPoint =[pointArray[0] CGPointValue];
//        [bezierPath addLineToPoint:tempPoint];
//        _shapeLayer.path = bezierPath.CGPath;
//
//        [self.layer addSublayer:_shapeLayer];
//
     
}
- (void)layoutSubviews {
    [super layoutSubviews];
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
    
//    [_bezierView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(_addDateLabel.mas_top).offset(5);
//        make.bottom.equalTo(_deadLineLabel.mas_top).offset(-5);
//        make.left.equalTo(_addDateLabel.mas_top);
//        make.right.equalTo(self.mas_right);
//
//    }];
    
}

@end
