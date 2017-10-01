//
//  ShipEditorViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/24/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipEditorViewController.h"
#import "ShipDataViewController.h"
#import "EquipmentDataViewController.h"


@interface ShipEditorViewController () <ShipHandler>
@property (strong, nonatomic) Ship *ship;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) IBOutlet UIButton *shipNameButton;
@property (strong, nonatomic) IBOutlet UIButton *equipment1Button;
@property (strong, nonatomic) IBOutlet UIButton *equipment2Button;
@property (strong, nonatomic) IBOutlet UIButton *equipment3Button;
@property (strong, nonatomic) IBOutlet UIButton *equipment4Button;
@property (strong, nonatomic) IBOutlet UIButton *equipment5Button;


@property (strong, nonatomic) NSString *buttonIdentify;
@end

@implementation ShipEditorViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self updateView];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)shipNameButtonTapped:(UIButton *)sender {
  self.buttonIdentify = @"shipName";
  [self performSegueWithIdentifier:@"shipEditorToShipSelect" sender:self];
  
}

- (IBAction)equipment1ButtonTapped:(UIButton *)sender {
  self.buttonIdentify = @"equipment1";
  [self performSegueWithIdentifier:@"shipEditorToEquipmentSelect" sender:self];
}

- (IBAction)equipment2ButtonTapped:(UIButton *)sender {
  self.buttonIdentify = @"equipment2";
  [self performSegueWithIdentifier:@"shipEditorToEquipmentSelect" sender:self];
}

- (IBAction)equipment3ButtonTapped:(UIButton *)sender {
  self.buttonIdentify = @"equipment3";
  [self performSegueWithIdentifier:@"shipEditorToEquipmentSelect" sender:self];
}

- (IBAction)equipment4ButtonTapped:(UIButton *)sender {
  self.buttonIdentify = @"equipment4";
  [self performSegueWithIdentifier:@"shipEditorToEquipmentSelect" sender:self];
}

- (IBAction)equipment5ButtonTapped:(id)sender {
  self.buttonIdentify = @"equipment5";
  [self performSegueWithIdentifier:@"shipEditorToEquipmentSelect" sender:self];
}

- (void) viewWillDisappear:(BOOL)animated {
  
  if ( self.isMovingFromParentViewController) {
    if (self.ship && ![self.ship.shipName isEqualToString:@"空"]) {
      [self.delegate receiveShip:self.ship AtIndexPath:self.indexPath];
    } else {
      [self.delegate receiveShip:nil AtIndexPath:self.indexPath];
    }
  }
}

- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath{
  self.ship = ship;
  self.indexPath = indexPath;
  [self updateView];
}


- (void) updateView {
  if (self.ship) {
    [self.equipment1Button setEnabled:YES];
    [self.equipment2Button setEnabled:YES];
    [self.equipment3Button setEnabled:YES];
    [self.equipment4Button setEnabled:YES];
    [self.equipment5Button setEnabled:YES];
    [self.shipNameButton setTitle:self.ship.shipName forState:UIControlStateNormal];
    if (self.ship.equipment1 && ![self.ship.equipment1 isEqualToString:@"空"]) {
      [self.equipment1Button setTitle:self.ship.equipment1 forState:UIControlStateNormal];
    } else {
      [self.equipment1Button setTitle:@"装备" forState:UIControlStateNormal];
    }
    if (self.ship.equipment2 && ![self.ship.equipment2 isEqualToString:@"空"]) {
      [self.equipment2Button setTitle:self.ship.equipment2 forState:UIControlStateNormal];
    } else {
      [self.equipment2Button setTitle:@"装备" forState:UIControlStateNormal];
    }
    if (self.ship.equipment3 && ![self.ship.equipment3 isEqualToString:@"空"]) {
      [self.equipment3Button setTitle:self.ship.equipment3 forState:UIControlStateNormal];
    } else {
      [self.equipment3Button setTitle:@"装备" forState:UIControlStateNormal];
    }
    if (self.ship.equipment4 && ![self.ship.equipment4 isEqualToString:@"空"]) {
      [self.equipment4Button setTitle:self.ship.equipment4 forState:UIControlStateNormal];
    } else {
      [self.equipment4Button setTitle:@"装备" forState:UIControlStateNormal];
    }
    if (self.ship.equipment5 && ![self.ship.equipment5 isEqualToString:@"空"]) {
      [self.equipment5Button setTitle:self.ship.equipment5 forState:UIControlStateNormal];
    } else {
      [self.equipment5Button setTitle:@"扩展装备" forState:UIControlStateNormal];
    }
  } else {
    [self.equipment1Button setEnabled:NO];
    [self.equipment2Button setEnabled:NO];
    [self.equipment3Button setEnabled:NO];
    [self.equipment4Button setEnabled:NO];
    [self.equipment5Button setEnabled:NO];
  }
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  if ([self.buttonIdentify isEqualToString:@"shipName"]) {
    ShipDataViewController * dest = [segue destinationViewController];
    dest.delegate = self;
    [dest receiveShip:self.ship AtIndexPath:self.indexPath];
  } else {
    EquipmentDataViewController *dest = [segue destinationViewController];
    dest.delegate = self;
    [dest receiveButtonIdentify:self.buttonIdentify];
    [dest receiveShip:self.ship AtIndexPath:self.indexPath];
  }
}


@end
