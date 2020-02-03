//
//  ModelOneCell.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/3.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "ModelOneCell.h"
#import "ModelOne.h"
#
@implementation ModelOneCell

- (void)setLayOutInSubclass:(BaseModel *)baseModel {
    NSLog(@"32");
    ModelOne *one = (ModelOne *)baseModel;
    NSLog(@"123141");
}

@end
