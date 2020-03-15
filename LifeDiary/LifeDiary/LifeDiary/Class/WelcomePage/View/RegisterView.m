//
//  RegisterView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "RegisterView.h"
#import <Masonry.h>
@implementation RegisterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setUI {
    

    _headImage = [[UIImage alloc] init];
    self.backgroundColor = [UIColor whiteColor];
    self.headImageButton = [[UIButton alloc] init];
    //[self.headImageButton setImage: ]
    self.headImageButton.titleLabel.font = [UIFont systemFontOfSize:25];
    UIImage *image = [[UIImage imageNamed:@"headRegisterImage.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_headImageButton setImage:image forState:UIControlStateNormal];
    [self.headImageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_headImageButton];
    self.headImageButton.layer.cornerRadius = 81.2/2;
    self.headImageButton.clipsToBounds = YES;
    [_headImageButton addTarget:self action:@selector(clickHeadButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: self.headImageButton];
    
    self.userTextField = [[UITextField alloc] init];
      self.userTextField.placeholder = @"请输入账号";
    [self addSubview:_userTextField];
     self.userTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.passTextField = [[UITextField alloc] init];
    [self addSubview:_passTextField];
      self.passTextField.placeholder = @"请输入密码";
      self.passTextField.layer.cornerRadius = 10;
      self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
    
      self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_registerButton];
    [self.registerButton setImage:[UIImage imageNamed:@"icon-test-2.png"] forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)pressRegisterButton {
    NSArray *array = [NSArray arrayWithObjects:_userTextField.text, _passTextField.text, _headImage,nil];
    [self.RegiserDelegate registerUser:array];
}

- (void)layoutSubviews {
    [_headImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (self.mas_top).offset(self.frame.size.height / 5);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 3 / 10);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/2 - self.frame.size.height / 20);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/2 + self.frame.size.height / 20);
    }];
    [_userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_headImageButton.mas_bottom).offset(self.frame.size.height / 20);
    make.bottom.equalTo(_headImageButton.mas_bottom).offset(self.frame.size.height * 3 / 20 - 10);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/5);
        make.right.equalTo(self.mas_right).offset(-1 *self.frame.size.width / 5);
    }];

    [_passTextField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_userTextField.mas_bottom).offset(self.frame.size.height / 20);
    make.bottom.equalTo(_userTextField.mas_bottom).offset(self.frame.size.height * 3 / 20 - 10);
        make.left.equalTo(_userTextField.mas_left);
        make.right.equalTo(_userTextField.mas_right);
    }];

    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_passTextField.mas_bottom).offset(self.frame.size.height / 20);
    make.bottom.equalTo(_passTextField.mas_bottom).offset(self.frame.size.height * 3 / 20 + 20);
        
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/2 - self.frame.size.height / 20 - 10);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/2 + self.frame.size.height / 20 + 10);
    }];
}

- (void)clickHeadButton {
    [self.clickHeadButtonDelegate changeHeadImageView];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
}
@end
