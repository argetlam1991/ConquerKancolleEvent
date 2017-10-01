//
//  SignInViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/16/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "SignInViewController.h"
#import "SAMKeychain.h"
#import "SAMKeychainQuery.h"
@import Firebase;



@interface SignInViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignInViewController

- (void)viewDidLoad {
  NSArray *accounts = [SAMKeychain accountsForService:@"ConquerKancolle"];
  NSString *password = [SAMKeychain passwordForService:@"ConquerKancolle" account:accounts[0]];
  if (password) {
    [[FIRAuth auth] signInWithEmail:accounts[0]
                           password:password
                         completion:^(FIRUser *user, NSError *error) {
                           if (user) {
                             [self performSegueWithIdentifier:@"signInToMain" sender:nil];
                           }
                         }];
  }
  [super viewDidLoad];
}

- (IBAction)loginTapped:(id)sender {
  [[FIRAuth auth] signInWithEmail:self.emailTextField.text
                         password:self.passwordTextField.text
                       completion:^(FIRUser *user, NSError *error) {
                         if (user) {
                           [SAMKeychain setPassword:self.passwordTextField.text forService:@"ConquerKancolle" account:self.emailTextField.text];
                           [self performSegueWithIdentifier:@"signInToMain" sender:nil];
                         }
                       }];
}

- (IBAction)RegisterTapped:(id)sender {
  [self performSegueWithIdentifier:@"signintoregister" sender:nil];
  
}

@end
