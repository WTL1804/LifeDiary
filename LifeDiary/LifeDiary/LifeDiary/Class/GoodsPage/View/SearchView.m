//
//  SearchView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/4/27.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "SearchView.h"
#import "BaseModel.h"
#import "BaseTableViewCell.h"
@implementation SearchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setUI {
    
    self.resultMutArray = [[NSMutableArray alloc] init];
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
    [self addSubview:_headView];
    
    self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(25, 35, self.frame.size.width - 55, 35)];
    self.searchField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.searchField.layer.borderWidth = 0.1;
    self.searchField.layer.cornerRadius = 5;
    self.searchField.text = @" 输入要搜索的物品";
    self.searchField.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    self.searchField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-2.png"]];
    _searchField.leftViewMode = UITextFieldViewModeAlways;
    [_headView addSubview: self.searchField];
    _searchField.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    _searchField.delegate = self;
    _searchField.keyboardType = UIKeyboardTypeDefault;
    [_searchField becomeFirstResponder];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, self.frame.size.height - 100) style:UITableViewStyleGrouped];
    _mainTableView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_mainTableView];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _resultMutArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseModel *baseModel = [BaseModel initWithDictionary:_resultMutArray[indexPath.section]];
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(baseModel)];
    modelName = [modelName stringByAppendingString:@"Cell"];
    BaseTableViewCell *cell = [_mainTableView dequeueReusableCellWithIdentifier:modelName];
    if (cell == nil) {
        cell = [BaseTableViewCell initWithModel:baseModel];
    }
    [cell setLayOutInSubclass:baseModel];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.text = @"";
    return true;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    _changeTextBlock(string);
    return true;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchField resignFirstResponder];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_searchField resignFirstResponder];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_searchField resignFirstResponder];
}
@end
