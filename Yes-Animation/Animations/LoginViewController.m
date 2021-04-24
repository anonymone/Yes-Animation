//
//  LoginViewController.m
//  Yes-Animation
//
//  Created by Severus Peng on 2021/4/2.
//

#import "LoginViewController.h"
#import <Masonry.h>

CGFloat margin = 20;

@interface LoginViewController () <UITextFieldDelegate>
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
    [self UIConstraintIn];
}

- (void) viewWillDisappear:(BOOL)animated {
    
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
    [_loginHead setHidden:TRUE];
    
    [_userName setPlaceholder:@"UserName@anonymone.cc"];
    [_userName setTextAlignment:NSTextAlignmentCenter];
    [_userName setFont:contentFont];
    [_userName setTextColor:contentColor];
    [_userName setBorderStyle:UITextBorderStyleRoundedRect];
    [_userName setBackgroundColor:[UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1.0]];
    [_userName setKeyboardType:UIKeyboardTypeEmailAddress];
    
    [_passWord setPlaceholder:@"Password"];
    [_passWord setTextAlignment:NSTextAlignmentCenter];
    [_passWord setFont:contentFont];
    [_passWord setTextColor:contentColor];
    [_passWord setClearsOnBeginEditing:YES];
    [_passWord setBorderStyle:UITextBorderStyleRoundedRect];
    [_passWord setBackgroundColor:[UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1.0]];
    [_passWord setKeyboardType:UIKeyboardTypeAlphabet];
    [_passWord setSecureTextEntry:YES];
    
    [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn setTitleEdgeInsets:UIEdgeInsetsMake(1.0, 1.0, 1.0, 1.0)];
    [_loginBtn.titleLabel setFont:contentFont];
    [_loginBtn setBackgroundColor:[UIColor colorWithRed:153/250.0 green:204/250.0 blue:153/250.0 alpha:1.0]];
    [_loginBtn.layer setCornerRadius:10.0];
}

- (void) setUI {
    _userName = [[UITextField alloc] init];
    _passWord = [[UITextField alloc] init];
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginHead = [[UILabel alloc] init];
    _loginWait = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    
    _userName.delegate = self;
    _passWord.delegate = self;
    
    [self.view addSubview:_userName];
    [self.view addSubview:_passWord];
    [self.view addSubview:_loginBtn];
    [self.view addSubview:_loginHead];
    [_loginBtn addSubview:_loginWait];
    
    [self setUIStyle];
    [self UIActionConfig];
    
    [self UIConstraintOut];
}

- (void) UIActionConfig {
    [_loginBtn addTarget:self action:@selector(btnClickInside) forControlEvents:UIControlEventTouchDown];
    [_loginBtn addTarget:self action:@selector(btnClickUp) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    if([textField isEqual:_passWord]) {
        [self btnClickUp];
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
}

#pragma mark Animation

- (void) startAnimationEffect: (UIView *) view {
    [UIView transitionWithView:view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^(void){
        [view setHidden:FALSE];
    } completion:^(BOOL finish){
        
    }];
}

- (void) UIConstraintOut {
    CGFloat bias = 2*self.view.bounds.size.width;
    
    [_loginHead mas_remakeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin);
        make.trailing.equalTo(self.view).offset(-margin);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10*margin);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.1);
    }];
    
    [_userName mas_remakeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin-bias);
        make.trailing.equalTo(self.view).offset(-margin-bias);
        make.top.equalTo(_loginHead.mas_bottom).offset(margin);
        make.height.equalTo(_loginHead.mas_height).multipliedBy(0.5);
    }];
    
    [_passWord mas_remakeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin-bias);
        make.trailing.equalTo(self.view).offset(-margin-bias);
        make.top.equalTo(_userName.mas_bottom).offset(margin);
        make.height.equalTo(_userName.mas_height);
    }];
    
    [_loginBtn mas_remakeConstraints:^(MASConstraintMaker *make){
        make.height.equalTo(_userName.mas_height);
        make.width.equalTo(_userName.mas_width).multipliedBy(0.4);
        make.top.equalTo(_passWord.mas_bottom).offset(margin);
        make.centerX.equalTo(_passWord.mas_centerX);
    }];
    
    [_loginWait mas_remakeConstraints:^(MASConstraintMaker *make){
        make.height.equalTo(_loginBtn.mas_height);
        make.width.equalTo(_loginBtn.mas_height);
        make.centerX.equalTo(_loginBtn.mas_centerX);
        make.centerY.equalTo(_loginBtn.mas_centerY);
    }];
    
    [self.view layoutIfNeeded];
}

- (void) UIConstraintIn {
    [_loginHead mas_updateConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin);
        make.trailing.equalTo(self.view).offset(-margin);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10*margin);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.1);
    }];
    
    [_userName mas_updateConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin);
        make.trailing.equalTo(self.view).offset(-margin);
        make.top.equalTo(_loginHead.mas_bottom).offset(margin);
        make.height.equalTo(_loginHead.mas_height).multipliedBy(0.5);
    }];
    
    [self startAnimationEffect:_loginHead];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [self.view layoutIfNeeded];
    }
    completion:^(BOOL finish){
    
    }];
    
    [_passWord mas_updateConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.view).offset(margin);
        make.trailing.equalTo(self.view).offset(-margin);
        make.top.equalTo(_userName.mas_bottom).offset(margin);
        make.height.equalTo(_userName.mas_height);
    }];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [self.view layoutIfNeeded];
    }
    completion:^(BOOL finish){
    
    }];
    
    [_loginBtn mas_updateConstraints:^(MASConstraintMaker *make){
        make.height.equalTo(_userName.mas_height);
        make.width.equalTo(_userName.mas_width).multipliedBy(0.4);
        make.top.equalTo(_passWord.mas_bottom).offset(margin);
        make.centerX.equalTo(_passWord.mas_centerX);
    }];
    
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:1.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [self.view layoutIfNeeded];
    }
    completion:^(BOOL finish){
    
    }];
}

- (void) UIshake :(UIView *) view shakeRate: (CGFloat) value duration: (CGFloat) time {
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint x = CGPointMake(position.x, position.y);
    CGPoint y = CGPointMake(position.x - value, position.y);
    
    // Spring Animation
    CASpringAnimation *shakeAnimationWithSpring = [CASpringAnimation animationWithKeyPath:@"position"];
    [shakeAnimationWithSpring setFromValue:[NSValue valueWithCGPoint:x]];
    [shakeAnimationWithSpring setToValue:[NSValue valueWithCGPoint:y]];
    [shakeAnimationWithSpring setDamping:7.5];
    [shakeAnimationWithSpring setMass:2.0];
    [shakeAnimationWithSpring setDuration:shakeAnimationWithSpring.settlingDuration];
    
    // Rotation
    CAKeyframeAnimation *shakeAnimationWithRotation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    [shakeAnimationWithRotation setDuration:time];
    [shakeAnimationWithRotation setRepeatCount:3];
    [shakeAnimationWithRotation setValues:@[@0.0, @(-3.14159/16.0), @0.0, @(3.14159/16.0)]];
    [shakeAnimationWithRotation setKeyTimes:@[@0.0, @0.25, @0.5, @0.75, @1.0]];
    
    // Shake with left and right
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [shakeAnimation setFromValue:[NSValue valueWithCGPoint:x]];
    [shakeAnimation setToValue:[NSValue valueWithCGPoint:y]];
    [shakeAnimation setAutoreverses:YES];
    [shakeAnimation setDuration:time];
    [shakeAnimation setRepeatCount:3];
    
    [viewLayer addAnimation:shakeAnimationWithRotation forKey:nil];
}

#pragma mark UI Action

- (void) btnClickInside {
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:2.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
        [self->_loginBtn setTransform:CGAffineTransformMakeScale(0.9,0.9)];
    } completion:^(BOOL finished){
    }];
}

- (void) btnClickUp {
    dispatch_queue_t queen = dispatch_get_main_queue();
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:2.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
        [self->_loginBtn setBackgroundColor:[UIColor colorWithRed:153/250.0 green:204/250.0 blue:153/250.0 alpha:1.0]];
        [self->_loginBtn setTransform:CGAffineTransformMakeScale(1.0,1.0)];
    } completion:^(BOOL finished){
        [self->_loginBtn.titleLabel setAlpha:0.0];
        [self->_loginWait startAnimating];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), queen, ^{
            [self->_loginWait stopAnimating];
            [self->_loginBtn setBackgroundColor:[UIColor redColor]];
            [self UIshake:self->_loginBtn shakeRate:20 duration:.1];
            [self->_loginBtn.titleLabel setAlpha:1.0];
        });
    }];
}

@end
