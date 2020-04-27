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
@interface SearchViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *allItemsArray;

@property (nonatomic, strong) SearchView *searchView;
@end

NS_ASSUME_NONNULL_END
