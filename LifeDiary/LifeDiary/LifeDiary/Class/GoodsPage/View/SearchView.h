//
//  SearchView.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/27.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface SearchView : UIView <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) UITextField *searchField;

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSMutableArray *resultMutArray;

@property (nonatomic, copy) void(^changeTextBlock)(NSString *string);
- (void)setUI;

@end

NS_ASSUME_NONNULL_END
