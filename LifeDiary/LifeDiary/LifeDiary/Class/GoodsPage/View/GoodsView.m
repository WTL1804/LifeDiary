//
//  GoodsView.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "GoodsView.h"
#import "BaseTableViewCell.h"
#import "BaseModel.h"
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
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
    
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
   // [self.mainTableView registerClass: [BaseTableViewCell class] forCellReuseIdentifier:@"GoodsViewCell"];
    [self addSubview:_mainTableView];
    
    _itemsArray = [[NSMutableArray alloc] init];
//    NSDictionary *dict = @{@"key":@"123",@"tag":@"BaseModel"};
//    [_itemsArray addObject:dict];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return _itemsArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.frame.size.height) / 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    self.mainCell = [_mainTableView dequeueReusableCellWithIdentifier:@"GoodsViewCell" forIndexPath:indexPath];
//    return _mainCell;
    
    BaseModel *baseModel = [BaseModel initWithDictionary:_itemsArray[indexPath.section]];
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(baseModel)];
    BaseTableViewCell *cell = [_mainTableView dequeueReusableCellWithIdentifier:modelName];
    if (cell == nil) {
        cell = [BaseTableViewCell initWithModel:baseModel];
    }
    [cell setLayOutInSubclass:baseModel];
    return cell;
}
@end
