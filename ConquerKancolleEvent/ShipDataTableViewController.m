//
//  ShipDataTableViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/23/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipDataTableViewController.h"
#import "ShipData.h"
#import "ShipDataTableViewCell.h"
#import "ShipEditorViewController.h"


@interface ShipDataTableViewController ()
@property (nonatomic, strong) ShipData *shipData;
@property (nonatomic, strong) Ship *ship;
@property (strong, nonatomic) NSIndexPath *indexPath;
@end

@implementation ShipDataTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.shipData = [[ShipData alloc] init];
  
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
  ShipDataTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  self.ship.shipName = cell.shipName;
  [self.navigationController popViewControllerAnimated:YES];
}

- (void) viewWillDisappear: (BOOL)animated {
  [self.delegate receiveShip:self.ship AtIndexPath:self.indexPath];
}

- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath {
  self.ship = ship;
  self.indexPath = indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 45.0f;
  //set height according to row or section , whatever you want to do!
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.shipData getShipKindsCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.shipData getShipDataCountWithKindIndex:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return [self.shipData getShipKindeAtIndex:section];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ShipDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shipDataCell" forIndexPath:indexPath];
  
  // Configure the cell...
  NSString *shipKind = [self.shipData getShipKindeAtIndex:indexPath.section];
  NSString *shipName = [self.shipData getShipDataAtIndex:indexPath.row withKind:shipKind];
  cell.shipName = shipName;
  [cell updateView];
  return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.

 }
 

@end
