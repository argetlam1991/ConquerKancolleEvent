//
//  SignInViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/16/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "SignInViewController.h"
@import Firebase;


@interface SignInViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignInViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}
- (IBAction)loginTapped:(id)sender {
  [[FIRAuth auth] signInWithEmail:self.emailTextField.text
                         password:self.passwordTextField.text
                       completion:^(FIRUser *user, NSError *error) {
                         if (user) {
                           [self performSegueWithIdentifier:@"signInToMain" sender:nil];
                         }
                       }];
  
}

- (IBAction)RegisterTapped:(id)sender {
}

@end
