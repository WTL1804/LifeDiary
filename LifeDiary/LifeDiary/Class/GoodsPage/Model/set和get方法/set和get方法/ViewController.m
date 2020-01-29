//
//  ViewController.m
//  set和get方法
//
//  Created by 王天亮 on 2020/1/26.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "ViewController.h"
#import "Wang.h"
@interface ViewController ()
@property (nonatomic, strong) Wang *wangPeople;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _wangPeople = [[Wang alloc] init];
    self.wangPeople.lastName = @"wang";
    [_wangPeople rushB];
    
}


@end
