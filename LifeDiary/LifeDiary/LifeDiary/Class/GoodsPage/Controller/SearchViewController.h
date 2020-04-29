//
//  SearchViewController.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/27.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SearchView;
@class SearchViewModel;
@protocol passCellOfSection <NSObject>

- (void)passSection:(NSInteger)number;

@end
@interface SearchViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *allItemsArray;

@property (nonatomic, strong) SearchView *searchView;

@property (nonatomic, strong) SearchViewModel *searchModel;

@property (nonatomic, weak) id <passCellOfSection> passSectionDelegate;

@end
NS_ASSUME_NONNULL_END
