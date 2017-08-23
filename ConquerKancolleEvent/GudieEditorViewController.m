//
//  GudieEditorViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "GudieEditorViewController.h"
#import "ShipTableViewCell.h"

@interface GudieEditorViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *fleetKindSegmentedControl;

@end

@implementation GudieEditorViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.titleTextField.text = @"2017夏活攻略";
  self.descriptionTextView.text = @"blablabla";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) viewWillDisappear:(BOOL)animated {
  
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
  [cell updateView];
  return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.

  
}



@end
