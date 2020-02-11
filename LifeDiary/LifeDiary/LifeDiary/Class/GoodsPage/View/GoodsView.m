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
    _itemsArray = [[NSMutableArray alloc] init];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    self.mainTableView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_mainTableView];

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return _itemsArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.frame.size.height) / 1.5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    self.mainCell = [_mainTableView dequeueReusableCellWithIdentifier:@"GoodsViewCell" forIndexPath:indexPath];
//    return _mainCell;
    
    BaseModel *baseModel = [BaseModel initWithDictionary:_itemsArray[indexPath.section]];
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(baseModel)];
    modelName = [modelName stringByAppendingString:@"Cell"];
    _cell = [_mainTableView dequeueReusableCellWithIdentifier:modelName];
    
    if (_cell == nil) {
        _cell = [BaseTableViewCell initWithModel:baseModel];
    }
    [_cell setLayOutInSubclass:baseModel];
    return _cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
@end
