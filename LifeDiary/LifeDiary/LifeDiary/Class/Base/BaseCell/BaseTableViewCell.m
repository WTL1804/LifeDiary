//
//  BaseTableViewCell.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "BaseModel.h"
@implementation BaseTableViewCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//   self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if ([reuseIdentifier isEqualToString:@"GoodsViewCell"]) {
//        return self;
//    }
//
//
//
//    return self;
//}
+ (instancetype)initWithModel:(BaseModel *)baseModel {
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(baseModel)];
    NSString *cellName = [modelName stringByAppendingString:@"Cell"];
    BaseTableViewCell *cell = [[NSClassFromString(cellName) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:modelName];
    return cell;
    
}
- (void)setLayOutInSubclass:(BaseModel *)baseModel {
    //子类重写此方法
}

@end
