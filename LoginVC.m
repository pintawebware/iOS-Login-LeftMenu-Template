//
//  LoginVC.m
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import "LoginVC.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MBProgressHUD.h"
#import "RequestMapManager.h"
#import "UserModel.h"

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSignal *validUsernameSignal = [self.email.rac_textSignal map:^id(NSString *text) {
         return @([self isValidUsername:text]);
     }];
    
    RACSignal *validPasswordSignal = [self.password.rac_textSignal map:^id(NSString *text) {
         return @([self isValidPassword:text]);
     }];
    
    RAC(self.password, backgroundColor) = [validPasswordSignal map:^id(NSNumber *passwordValid) {
         return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor lightGrayColor];
     }];
    
    RAC(self.email, backgroundColor) = [validUsernameSignal map:^id(NSNumber *passwordValid) {
         return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor lightGrayColor];
     }];
    
    
    RACSignal *signUpActiveSignal = [RACSignal combineLatest:@[validUsernameSignal, validPasswordSignal]
                                    reduce:^id(NSNumber *usernameValid, NSNumber *passwordValid) {
                                            return @([usernameValid boolValue] && [passwordValid boolValue]);
    }];
    
    [signUpActiveSignal subscribeNext:^(NSNumber *signupActive) {
        self.signInButton.enabled = [signupActive boolValue];
    }];
    
    [[[self.signInButton
        rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(id x) {
           self.signInButton.enabled = NO;
           
           [MBProgressHUD showHUDAddedTo:self.view animated:YES];
           [RequestMapManager loginWithEmail:self.email.text password:self.password.text completion:^(NSMutableArray *array, NSDictionary *dictionary, id object) {
               [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
               NSLog(@"%@", object);
               
               UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mainView"];
               [self.navigationController pushViewController:vc animated:YES];
           }];
           
       }]
     subscribeNext:^(NSNumber *signedIn) {
         self.signInButton.enabled = YES;
     }];
    
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 2;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 6;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
