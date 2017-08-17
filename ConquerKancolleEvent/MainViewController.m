//
//  MainViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/16/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UILabel *UserNameLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.UserNameLabel.text = [FIRAuth auth].currentUser.displayName;
  
  // Do any additional setup after loading the view.
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
