//
//  GudieEditorViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "GudieEditorViewController.h"
#import "ShipTableViewCell.h"
#import "ShipHandler.h"
#import "ShipEditorViewController.h"
#import "Guide.h"
#import "Guides.h"

@interface GuideEditorViewController () <UITableViewDelegate, UITableViewDataSource, ShipHandler>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *fleetKindSegmentedControl;
@property (strong, nonatomic) Guide *guide;
@property (strong, nonatomic) Guides *guides;

@end

@implementation GuideEditorViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  if (!self.guide) {
    self.guide = [[Guide alloc] initWithEmptyFleet];
  }
  [self updateView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) viewWillDisappear:(BOOL)animated {
  if (self.isMovingFromParentViewController) {
    self.guide.title = self.titleTextField.text;
    self.guide.guideDescription = self.descriptionTextView.text;
    [self.guides addGuide:self.guide];

  }
}


- (IBAction)switchFleetKind:(id)sender {
  [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  if ([self.fleetKindSegmentedControl selectedSegmentIndex] == 0) {
    return 1;
  } else {
    return 2;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 40; //play around with this value
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  switch (section) {
    case 1:
      return @"第二舰队";
      break;
    default:
      return @"第一舰队";
      break;
  }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ShipTableViewCell *cell = (ShipTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"ShipCellIdentifier" forIndexPath:indexPath];
  // Configure the cell...
  cell.indexPath = indexPath;
  [cell receiveShip:[self.guide getShipAtIndex:indexPath.section * 6 + indexPath.row]];
  [cell updateView];
  return cell;
}

- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath{
  /*
   ShipTableViewCell *cell = (ShipTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
   cell.ship = ship;
   [cell updateView];
   */
  [self.guide setShip:ship AtIndex:indexPath.section * 6 + indexPath.row];
  [self.tableView reloadData];
}

- (void) receiveGuide:(Guide *) guide{
  self.guide = guide;
  [self updateView];
}

- (void) receiveGuides:(Guides *) guides {
  self.guides = guides;
}

- (void) updateView {
  if (self.guide) {
    self.titleTextField.text = self.guide.title;
    self.descriptionTextView.text = self.guide.guideDescription;
    [self.tableView reloadData];
  }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  if([sender isMemberOfClass:[UIBarButtonItem class]]) {
  }
  else{
    
    ShipEditorViewController *child = (ShipEditorViewController *)[segue destinationViewController];
    
    ShipTableViewCell *source = (ShipTableViewCell *)sender;
    child.delegate = self;
    [child receiveShip:source.ship AtIndexPath:source.indexPath];
  }
}



@end
