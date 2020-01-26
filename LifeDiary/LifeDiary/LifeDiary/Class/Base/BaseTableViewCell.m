//
//  BaseTableViewCell.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
   self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([reuseIdentifier isEqualToString:@"GoodsViewCell"]) {
        return self;
    }
    
    
    
    return self;
}

@end
