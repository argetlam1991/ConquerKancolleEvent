//
//  ShipEditorViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/24/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipEditorViewController.h"
#import "ShipDataTableViewController.h"


@interface ShipEditorViewController () <ShipHandler>
@property (strong, nonatomic) Ship *ship;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) IBOutlet UIButton *shipNameButton;
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
  self.buttonIdentify = @"shipNameButton";
  [self performSegueWithIdentifier:@"shipEditorToShipSelect" sender:self];
  
}

- (void) viewWillDisappear:(BOOL)animated {
  
  if (!self.ship) {
    self.ship = [[Ship alloc] init];
  }
  if (self.ship.shipName) {
    [self.delegate receiveShip:self.ship AtIndexPath:self.indexPath];
  }
}

- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath{
  self.ship = ship;
  self.indexPath = indexPath;
  [self updateView];
}

- (void) updateView {
  if (self.ship) {
    [self.shipNameButton setTitle:self.ship.shipName forState:UIControlStateNormal];
  }
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  
  ShipDataTableViewController * dest = [segue destinationViewController];
  dest.delegate = self;
  [dest receiveShip:self.ship AtIndexPath:self.indexPath];
  
}


@end
