//
//  SignupViewController.m
//  Instagram2.0
//
//  Created by Adriana Jimenez Mangas on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Sign Up";
}

- (IBAction)onSignupButton:(UIButton *)sender {
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
