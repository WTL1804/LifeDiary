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
    [_photoBtn setImage:[UIImage imageNamed:@"照相机.png"] forState:UIControlStateNormal];
    [_photoBtn setTitleEdgeInsets:UIEdgeInsetsMake(55, -24, 0, 42)];
    [_photoBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [_photoBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    _itemNameTextField = [[UITextField alloc] init];
    [self addSubview:_itemNameTextField];
    _itemNameTextField.placeholder  = @"物品名称";
   // _itemNameTextField.layer.borderWidth = 0.1;
    //_itemNameTextField.layer.borderColor = [UIColor blueColor].CGColor;
    _itemNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _itemNamePropertiesTextField = [[UITextField alloc] init];
    [self addSubview: _itemNamePropertiesTextField];
    _itemNamePropertiesTextField.placeholder = @"物品属性(可手动归类)";
   
    _itemNamePropertiesTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _dateTextField = [[UITextField alloc] init];
    [self addSubview: _dateTextField];
    _dateTextField.borderStyle = UITextBorderStyleRoundedRect;
    _dateTextField.delegate = self;
    _dateTextField.placeholder =@"生产日期";
    
    
    //ShelfLifeTextField
    _ShelfLifeTextField = [[UITextField alloc] init];
    [self addSubview: _ShelfLifeTextField];
    _ShelfLifeTextField.borderStyle = UITextBorderStyleRoundedRect;
    _ShelfLifeTextField.delegate = self;
    _ShelfLifeTextField.placeholder =@"保质期/天";
    //numberTextField
    _numberTextField = [[UITextField alloc] init];
    [self addSubview: _numberTextField];
    _numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    _numberTextField.delegate = self;
    _numberTextField.placeholder =@"数量/个";
    
    
    
    self.datePicker = [[UIDatePicker alloc] init];
    _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    [_datePicker setDate:[NSDate date]];
    self.datePicker.frame = CGRectMake(0, self.frame.size.height-200, self.frame.size.width, 200);
    [self.datePicker addTarget:self action:@selector(dateUpdate) forControlEvents:UIControlEventValueChanged];
    
    
}
- (void)layoutSubviews {
  
    [_photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height/5);
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/3.5+15);
    }];
    
    [_itemNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.bottom.equalTo (self.mas_top).offset(60);
        make.left.equalTo(_photoBtn.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-40);
    }];
    
    
    [_itemNamePropertiesTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_itemNameTextField.mas_bottom).offset(10);
        make.bottom.equalTo (_itemNameTextField.mas_bottom).offset(50);
        make.left.equalTo(_photoBtn.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-40);
    }];
    [_dateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_photoBtn.mas_bottom).offset(10);
        make.bottom.equalTo(_photoBtn.mas_bottom).offset(50);
        make.left.equalTo(_itemNameTextField.mas_left);
        make.right.equalTo(_itemNameTextField.mas_right);
    }];
    [_ShelfLifeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_dateTextField.mas_bottom).offset(10);
        make.bottom.equalTo(_dateTextField.mas_bottom).offset(50);
        make.left.equalTo(_dateTextField.mas_left);
        make.right.equalTo(_dateTextField.mas_right);
    }];
    [_numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(_ShelfLifeTextField.mas_bottom).offset(10);
       make.bottom.equalTo(_ShelfLifeTextField.mas_bottom).offset(50);
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
- (void)dateUpdate {
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *data = [self.datePicker date];
    NSString *string = [myDateFormatter stringFromDate:data];
    self.dateTextField.text = string;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_dateTextField resignFirstResponder];
}
@end
