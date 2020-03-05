//
//  AddItemsView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/16.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "AddItemsView.h"
#import <Masonry.h>
@implementation AddItemsView 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    
    _photoBtn = [[UIButton alloc] init];
   // _photoBtn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self addSubview:_photoBtn];
    [_photoBtn setTitle:@"照片" forState:UIControlStateNormal];
    [_photoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    UIImage *image = [[UIImage imageNamed:@"照相机.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_photoBtn setImage:image forState:UIControlStateNormal];
//    [_photoBtn setTitleEdgeInsets:UIEdgeInsetsMake(55, -24, 0, 42)];
//    [_photoBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
//    [_photoBtn setTitleEdgeInsets:UIEdgeInsetsMake(55, -24, 0, 42)];
//    [_photoBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [_photoBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
//    _photoBtn.layer.borderWidth  = 0.1;
//    _photoBtn.layer.borderColor = [UIColor blackColor].CGColor;
    
    _itemNameTextField = [[UITextField alloc] init];
    [self addSubview:_itemNameTextField];
    _itemNameTextField.placeholder  = @"名称";
    _itemNameTextField.delegate = self;
   // _itemNameTextField.layer.borderWidth = 0.1;
    //_itemNameTextField.layer.borderColor = [UIColor blueColor].CGColor;
    _itemNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _itemNameTextField.keyboardType = UIKeyboardTypeDefault;
    
    UIImageView *nameLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    [nameLeftImageView setImage:[[UIImage imageNamed:@"biaoqian.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [_itemNameTextField setLeftView:nameLeftImageView];
    _itemNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    
    _itemNamePropertiesTextField = [[UITextField alloc] init];
    [self addSubview: _itemNamePropertiesTextField];
    _itemNamePropertiesTextField.placeholder = @"属性(自动识别)";
    _itemNamePropertiesTextField.delegate = self;
    _itemNamePropertiesTextField.borderStyle = UITextBorderStyleRoundedRect;
    _itemNamePropertiesTextField.keyboardType = UIKeyboardTypeDefault;
    
    UIImageView *propertyLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
       [propertyLeftImageView setImage:[[UIImage imageNamed:@"shuxing.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
       [_itemNamePropertiesTextField setLeftView:propertyLeftImageView];
       _itemNamePropertiesTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    _dateTextField = [[UITextField alloc] init];
    [self addSubview: _dateTextField];
    _dateTextField.borderStyle = UITextBorderStyleRoundedRect;
    _dateTextField.delegate = self;
    _dateTextField.placeholder =@"生产日期";
    UIImageView *dateLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    [dateLeftImageView setImage:[[UIImage imageNamed:@"riqi.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [_dateTextField setLeftView:dateLeftImageView];
    _dateTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    
    //ShelfLifeTextField
    _ShelfLifeTextField = [[UITextField alloc] init];
    [self addSubview: _ShelfLifeTextField];
    _ShelfLifeTextField.borderStyle = UITextBorderStyleRoundedRect;
    _ShelfLifeTextField.delegate = self;
    _ShelfLifeTextField.placeholder =@"保质期/天";
    _ShelfLifeTextField.keyboardType = UIKeyboardTypeDefault;
    
    //numberTextField
    _numberTextField = [[UITextField alloc] init];
    [self addSubview: _numberTextField];
    _numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    _numberTextField.delegate = self;
    _numberTextField.placeholder =@"数量/个";
    _numberTextField.keyboardType = UIKeyboardTypeDefault;
    UIImageView *numberLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
    [numberLeftImageView setImage:[[UIImage imageNamed:@"shuliang.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [_numberTextField setLeftView:numberLeftImageView];
    _numberTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.datePicker = [[UIDatePicker alloc] init];
    _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    [_datePicker setDate:[NSDate date]];
    //self.datePicker.frame = CGRectMake(0, self.frame.size.height-200, self.frame.size.width, 200);
    [self.datePicker addTarget:self action:@selector(dateUpdate) forControlEvents:UIControlEventValueChanged];
    
    _addItems = [[Items alloc] init];
    
    _photoImageView = [[UIImageView alloc] init];
    [self addSubview:_photoImageView];
    _photoImageView.layer.masksToBounds = YES;
    _photoImageView.layer.borderWidth  = 1;
    _photoImageView.layer.borderColor = [UIColor blackColor].CGColor;
    
    _describeTextField = [[UITextField alloc] init];
    [self addSubview: _describeTextField];
    _describeTextField.placeholder = @"留下一些物品描述吧";
    _describeTextField.delegate = self;
    _describeTextField.borderStyle = UITextBorderStyleRoundedRect;
    _describeTextField.keyboardType = UIKeyboardTypeDefault;
    UIImageView *describeLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
    [describeLeftImageView setImage:[[UIImage imageNamed:@"miaoshu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [_describeTextField setLeftView:describeLeftImageView];
    _describeTextField.leftViewMode = UITextFieldViewModeAlways;
    

}
//- (void)layoutSubviews {
//
//    [_photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top);
//        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height/5);
//        make.left.equalTo(self.mas_left).offset(15);
//        make.right.equalTo(self.mas_left).offset(self.frame.size.width/3.5+15);
//    }];
//    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(20);
//        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height/5);
//        make.left.equalTo(self.mas_left).offset(15);
//        make.right.equalTo(self.mas_left).offset(self.frame.size.width/3.5+15);
//    }];
//
//
//    [_itemNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(20);
//        make.bottom.equalTo (self.mas_top).offset(60);
//        make.left.equalTo(_photoBtn.mas_right).offset(10);
//        make.right.equalTo(self.mas_right).offset(-40);
//    }];
//
//
//    [_itemNamePropertiesTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_itemNameTextField.mas_bottom).offset(10);
//        make.bottom.equalTo (_itemNameTextField.mas_bottom).offset(50);
//        make.left.equalTo(_photoBtn.mas_right).offset(10);
//        make.right.equalTo(self.mas_right).offset(-40);
//    }];
//    [_dateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_photoBtn.mas_bottom).offset(10);
//        make.bottom.equalTo(_photoBtn.mas_bottom).offset(50);
//        make.left.equalTo(_itemNameTextField.mas_left);
//        make.right.equalTo(_itemNameTextField.mas_right);
//    }];
//    [_ShelfLifeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_dateTextField.mas_bottom).offset(10);
//        make.bottom.equalTo(_dateTextField.mas_bottom).offset(50);
//        make.left.equalTo(_dateTextField.mas_left);
//        make.right.equalTo(_dateTextField.mas_right);
//    }];
//    [_numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.top.equalTo(_ShelfLifeTextField.mas_bottom).offset(10);
//       make.bottom.equalTo(_ShelfLifeTextField.mas_bottom).offset(50);
//       make.left.equalTo(_ShelfLifeTextField.mas_left);
//       make.right.equalTo(_ShelfLifeTextField.mas_right);
//    }];
//}
- (void)layoutSubviews {
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    [_photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(height / 20);
        make.bottom.equalTo(self.mas_top).offset(height * 5 / 20);
        make.left.equalTo(self.mas_left).offset(width / 2 - height / 8);
        make.right.equalTo(self.mas_left).offset(width / 2 + height / 8);
    }];
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(height / 20);
        make.bottom.equalTo(self.mas_top).offset(height * 5 / 20);
        make.left.equalTo(self.mas_left).offset(width / 2 - height / 8);
        make.right.equalTo(self.mas_left).offset(width / 2 + height / 8);
    }];
    
    [_itemNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_photoBtn.mas_bottom).offset(height / 30);
        make.bottom.equalTo(_photoBtn.mas_bottom).offset(height * 7 / 60);
        make.left.equalTo(self.mas_left).offset(height / 20);
        make.right.equalTo(self.mas_left).offset(height / 20 + width * 3 / 10);
    }];
    
    [_itemNamePropertiesTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_photoBtn.mas_bottom).offset(height / 30);
        make.bottom.equalTo(_photoBtn.mas_bottom).offset(height * 7 / 60);
        make.left.equalTo(_itemNameTextField.mas_right).offset(height / 30);
        make.right.equalTo(_itemNameTextField.mas_right).offset(height / 30 + width / 2);
    }];
    
    [_dateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_itemNameTextField.mas_bottom).offset(height / 30);
        make.bottom.equalTo(_itemNameTextField.mas_bottom).offset(height * 7 / 60);
        make.left.equalTo(self.mas_left).offset(height / 20);
        make.right.equalTo(self.mas_left).offset(height / 20 + width / 2);
    }];
    
    [_ShelfLifeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_itemNameTextField.mas_bottom).offset(height / 30);
        make.bottom.equalTo(_itemNameTextField.mas_bottom).offset(height * 7 / 60);
        make.left.equalTo(_dateTextField.mas_right).offset(height / 30);
        make.right.equalTo(_dateTextField.mas_right).offset(height / 30 + width * 3 / 10);
    }];
    
    [_describeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(_ShelfLifeTextField.mas_bottom).offset(height / 30);
       make.bottom.equalTo(_ShelfLifeTextField.mas_bottom).offset(height * 14 / 60);
       make.left.equalTo(self.mas_left).offset(height / 30);
       make.right.equalTo(_ShelfLifeTextField.mas_right);
    }];
    
    [_numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(_describeTextField.mas_bottom).offset(height / 30);
       make.bottom.equalTo(_describeTextField.mas_bottom).offset(height * 7 / 60);
       make.left.equalTo(_ShelfLifeTextField.mas_left);
       make.right.equalTo(_ShelfLifeTextField.mas_right);
    }];
    
}
- (void)clickBtn {
    [self.delegateClickCamera clickCamera];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _dateTextField) {
        _dateTextField.inputView = _datePicker;
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == _itemNameTextField) {
        self.addItems.name = [_itemNameTextField.text copy];
    }
    if (textField == _numberTextField) {
        self.addItems.numberOfItem = [NSNumber numberWithInt: [_numberTextField.text intValue]];
    }
    if (textField == _ShelfLifeTextField) {
        self.addItems.shelfLifeNumber = [NSNumber numberWithInt: [_ShelfLifeTextField.text intValue]];
    }
    if (textField == _describeTextField) {
        self.addItems.describeString = [textField.text copy];
    }
}
- (void)dateUpdate {
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *data = [self.datePicker date];
    NSString *string = [myDateFormatter stringFromDate:data];
    self.dateTextField.text = string;
    self.addItems.productionDate = [self.datePicker date];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_dateTextField resignFirstResponder];
    [_numberTextField resignFirstResponder];
    [_itemNamePropertiesTextField resignFirstResponder];
    [_itemNameTextField resignFirstResponder];
    [_ShelfLifeTextField resignFirstResponder];
    [_describeTextField resignFirstResponder];
}
@end
