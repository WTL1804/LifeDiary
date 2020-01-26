//
//  GoodsView.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "GoodsView.h"
#import "BaseTableViewCell.h"
@implementation GoodsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    [self.mainTableView registerClass: [BaseTableViewCell class] forCellReuseIdentifier:@"GoodsViewCell"];
    [self addSubview:self.mainTableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.frame.size.height) / 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _mainCell = [self.mainTableView dequeueReusableCellWithIdentifier:@"GoodsViewCell" forIndexPath:indexPath];
    return _mainCell;
}
@end
