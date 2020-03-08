//
//  LoginView.m
//  LifeDiary
//
//  Created by 王天亮 on 2020/3/4.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "LoginView.h"
#import <Masonry.h>
@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
        self.backgroundColor = [UIColor whiteColor];
        self.headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_3251.JPG"]];
        [self addSubview:_headImageView];
        self.headImageView.layer.cornerRadius = 81.2/2;
        self.headImageView.clipsToBounds = YES;
        [self addSubview: self.headImageView];
        
        
        
        
        self.userTextField = [[UITextField alloc] init];
        [self addSubview:self.userTextField];
        
        self.passTextField = [[UITextField alloc] init];
        [self addSubview:self.passTextField];
        _passTextField.secureTextEntry = YES;
        
        self.userTextField.borderStyle = UITextBorderStyleRoundedRect;
        self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
        
        self.userTextField.layer.cornerRadius = 10;
        self.passTextField.layer.cornerRadius = 10;
        
        self.userTextField.placeholder = @"请输入账号";
        self.passTextField.placeholder = @"请输入密码";
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.loginButton];
        [self.loginButton setImage:[UIImage imageNamed:@"icon-test.png"] forState:UIControlStateNormal];
        self.loginButton.layer.cornerRadius = 10;
        [self.loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];

        
        self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.registerButton];
        [self.registerButton setTitle:@"没有账号？点击注册" forState:UIControlStateNormal];
        [self.registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [self.registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressRegister {
    
    [self.registerDelegate registerApp];
}
- (void)pressLogin {
        NSArray *array = [NSArray arrayWithObjects:_userTextField.text, _passTextField.text,nil];
        [self.loginDelegate login:array];
}
- (void)layoutSubviews {
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (self.mas_top).offset(self.frame.size.height / 5);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 3 / 10);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/2 - self.frame.size.height / 20);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/2 + self.frame.size.height / 20);
    }];
    [_userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_headImageView.mas_bottom).offset(self.frame.size.height / 20);
    make.bottom.equalTo(_headImageView.mas_bottom).offset(self.frame.size.height * 3 / 20 - 10);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/5);
        make.right.equalTo(self.mas_right).offset(-1 *self.frame.size.width / 5);
    }];
    
    [_passTextField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_userTextField.mas_bottom).offset(self.frame.size.height / 20);
    make.bottom.equalTo(_userTextField.mas_bottom).offset(self.frame.size.height * 3 / 20 - 10);
        make.left.equalTo(_userTextField.mas_left);
        make.right.equalTo(_userTextField.mas_right);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_passTextField.mas_bottom).offset(self.frame.size.height / 20);
    make.bottom.equalTo(_passTextField.mas_bottom).offset(self.frame.size.height * 3 / 20 + 20);
        
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/2 - self.frame.size.height / 20 - 10);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/2 + self.frame.size.height / 20 + 10);
    }];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(- self.frame.size.height / 20 - 20);
        make.bottom.equalTo(self.mas_bottom).offset(-20);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/2 - 70);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/2 + 70);
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_passTextField resignFirstResponder];
    [_userTextField resignFirstResponder];
}
@end
