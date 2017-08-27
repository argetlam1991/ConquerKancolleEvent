//
//  ShipEditorViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/24/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipEditorViewController.h"


@interface ShipEditorViewController () <ShipHandler>
@property (strong, nonatomic) Ship *ship;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) IBOutlet UITextField *shipNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment1TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment2TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment3TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment4TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment5TextField;

@end

@implementation ShipEditorViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  if (self.ship) {
    self.shipNameTextField.text = self.ship.shipName;
    self.equipment1TextField.text = self.ship.equipment1;
    self.equipment2TextField.text = self.ship.equipment2;
    self.equipment3TextField.text = self.ship.equipment3;
    self.equipment4TextField.text = self.ship.equipment4;
    self.equipment5TextField.text = self.ship.equipment5;
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) viewWillDisappear:(BOOL)animated {
  if (self.shipNameTextField.text) {
    if (!self.ship) {
      self.ship = [[Ship alloc] init];
    }
    self.ship.shipName = self.shipNameTextField.text;
    self.ship.equipment1 = self.equipment1TextField.text;
    self.ship.equipment2 = self.equipment2TextField.text;
    self.ship.equipment3 = self.equipment3TextField.text;
    self.ship.equipment4 = self.equipment4TextField.text;
    self.ship.equipment5 = self.equipment5TextField.text;
    [self.delegate receiveShip:self.ship AtIndexPath:self.indexPath];
  }
}

- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath{
  self.ship = ship;
  self.indexPath = indexPath;
  
  
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
