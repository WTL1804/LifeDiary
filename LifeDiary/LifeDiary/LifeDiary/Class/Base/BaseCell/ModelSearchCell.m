//
//  ModelSearchCell.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/28.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "ModelSearchCell.h"
#import "ModelSearch.h"
#import <Masonry.h>
@implementation ModelSearchCell

- (void)setLayOutInSubclass:(BaseModel *)baseModel {
    ModelSearch *model = (ModelSearch *)baseModel;
    
    _itemsPhotoImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:model.imageData]];
    _itemsPhotoImageView.layer.masksToBounds = YES;
    _itemsPhotoImageView.layer.cornerRadius = 30;
    [self addSubview:_itemsPhotoImageView];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = model.name;
    [self addSubview:_nameLabel];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
}
- (void)layoutSubviews {
    [_itemsPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.frame.size.height/8);
        make.bottom.equalTo(self.mas_bottom).offset(-self.frame.size.height/8);
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_left).offset(self.frame.size.height * 3 / 4 + 15);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.frame.size.height/8);
        make.bottom.equalTo(self.mas_bottom).offset(-self.frame.size.height/8);
        make.left.equalTo(_itemsPhotoImageView.mas_right).offset(15);
        make.right.equalTo(_itemsPhotoImageView).offset(self.frame.size.width * 3 / 4 + 15);
    }];
}
@end
