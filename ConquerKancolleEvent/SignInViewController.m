//
//  SignInViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/16/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "SignInViewController.h"


@interface SignInViewController ()

@property(strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;
@property (weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

@implementation SignInViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [GIDSignIn sharedInstance].uiDelegate = self;
  [[GIDSignIn sharedInstance] signInSilently];
  
  self.handle = [[FIRAuth auth]
                 addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
                   if (user) {
                     [self performSegueWithIdentifier:@"signInToMain" sender:nil];
                   }
                 }];
}

@end
