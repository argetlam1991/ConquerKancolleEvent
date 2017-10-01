//
//  RegisterViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/13/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "RegisterViewController.h"
@import Firebase;

@interface RegisterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *nickNameTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitTapped:(UIButton *)sender {
  if (!(self.emailTextField.text && self.passwordTextField.text && self.nickNameTextField.text)) {
    NSLog(@"Required TextField is Empty");
    return ;
  }
  [[FIRAuth auth] createUserWithEmail:self.emailTextField.text
                             password:self.passwordTextField.text
                           completion:^(FIRUser *_Nullable user, NSError *_Nullable error) {
                             NSLog(@"%@", error.description);
                             FIRUserProfileChangeRequest *changeRequest = [[FIRAuth auth].currentUser profileChangeRequest];
                             changeRequest.displayName = self.nickNameTextField.text;
                             [changeRequest commitChangesWithCompletion:^(NSError *_Nullable error) {
                               [self performSegueWithIdentifier:@"registertosignin" sender:nil];
                             }];
                           }];
}
- (IBAction)cancleTapped:(UIButton *)sender {
  [self performSegueWithIdentifier:@"registertosignin" sender:nil];
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
