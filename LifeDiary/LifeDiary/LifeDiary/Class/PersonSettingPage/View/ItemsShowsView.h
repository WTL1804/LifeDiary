//
//  itemsShowsView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/2/26.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemsShowsView : UIView

@property (nonatomic, strong) NSMutableDictionary *itemsDict;
@property (nonatomic, strong) UIImageView *itemsImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIProgressView *progressView;

- (void)setUI;
@end

NS_ASSUME_NONNULL_END
