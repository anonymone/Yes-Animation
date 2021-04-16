//
//  LoginViewController.m
//  Yes-Animation
//
//  Created by Severus Peng on 2021/4/2.
//

#import "LoginViewController.h"
#import <Masonry.h>

@interface LoginViewController ()
@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *passWord;
@property (nonatomic, strong) UILabel *loginHead;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIActivityIndicatorView *loginWait;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    
}

- (void) viewWillAppear:(BOOL)animated {
}

- (void) viewDidAppear:(BOOL)animated {
    CGFloat bias = 2*self.view.bounds.size.width;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [self->_userName setCenter:CGPointMake(self->_userName.center.x+bias, self->_userName.center.y)];
    }
    completion:^(BOOL finish){
        
    }];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [self->_passWord setCenter:CGPointMake(self->_passWord.center.x+bias, self->_passWord.center.y)];
    }
    completion:^(BOOL finish){
        
    }];
    
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [self->_loginBtn setCenter:CGPointMake(self->_loginBtn.center.x+bias, self->_loginBtn.center.y)];
    }
    completion:^(BOOL finish){
        
    }];
}

#pragma mark UI Config

- (void) setUIStyle {
    UIColor *titleColor = [UIColor colorWithRed:0.89 green:0.38 blue:0.0 alpha:1.0];
    UIColor *contentColor = [UIColor colorWithRed:0.38 green:0.5 blue:0.89 alpha:1.0];
    
    UIFont *titleFont = [UIFont fontWithName:@"HelveticaNeue" size:36.0];
    UIFont *contentFont = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
    
    [_loginHead setText:@"Login Page"];
    [_loginHead setTextAlignment:NSTextAlignmentCenter];
    [_loginHead setFont:titleFont];
    [_loginHead setTextColor:titleColor];
    
    [_userName setText:@"User Name"];
    [_userName setTextAlignment:NSTextAlignmentCenter];
    [_userName setFont:contentFont];
    [_userName setTextColor:contentColor];
    
    [_passWord setText:@"Password"];
    [_passWord setTextAlignment:NSTextAlignmentCenter];
    [_passWord setFont:contentFont];
    [_passWord setTextColor:contentColor];
    
    [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:contentColor forState:UIControlStateNormal];
}

- (void) setUI {
    _userName = [[UITextField alloc] init];
    _passWord = [[UITextField alloc] init];
    _loginBtn = [[UIButton alloc] init];
    _loginHead = [[UILabel alloc] init];
    _loginWait = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    
    [self setUIStyle];
    
    [self.view addSubview:_userName];
    [self.view addSubview:_passWord];
    [self.view addSubview:_loginBtn];
    [self.view addSubview:_loginHead];
    [_loginBtn addSubview:_loginWait];
    
    CGFloat margin = 20;
    CGFloat bias = 2*self.view.bounds.size.width;
    
    [_loginHead mas_makeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin);
        make.trailing.equalTo(self.view).offset(-margin);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10*margin);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.1);
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin-bias);
        make.trailing.equalTo(self.view).offset(-margin-bias);
        make.top.equalTo(_loginHead.mas_bottom).offset(margin);
        make.height.equalTo(_loginHead.mas_height).multipliedBy(0.5);
    }];
    
    [_passWord mas_makeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin-bias);
        make.trailing.equalTo(self.view).offset(-margin-bias);
        make.top.equalTo(_userName.mas_bottom).offset(margin);
        make.height.equalTo(_userName.mas_height);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.equalTo(_userName.mas_height);
        make.width.equalTo(_userName.mas_width).multipliedBy(0.4);
        make.top.equalTo(_passWord.mas_bottom).offset(margin);
        make.centerX.equalTo(_passWord.mas_centerX);
    }];
    
    [_loginWait mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.equalTo(_loginBtn.mas_height);
        make.width.equalTo(_loginBtn.mas_height);
        make.centerX.equalTo(_loginBtn.mas_centerX);
        make.centerY.equalTo(_loginBtn.mas_centerY);
    }];
}

@end
