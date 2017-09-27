//
//  ShipDataViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/26/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipDataViewController.h"
#import "ShipData.h"
#import "ShipDataTableViewCell.h"

const NSUInteger kHeaderSectionTag = 10000;

@interface ShipDataViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ShipData *shipData;
@property (assign) NSInteger expandedSectionHeaderNumber;
@property (assign) UITableViewHeaderFooterView *expandedSectionHeader;

@end

@implementation ShipDataViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.shipData = [[ShipData alloc] init];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  return 45.0f;
  //set height according to row or section , whatever you want to do!
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.shipData getShipKindsCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (self.expandedSectionHeaderNumber == section) {
    return [self.shipData getShipDataCountWithKindIndex:section];
  } else {
    return 0;
  }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return [self.shipData getShipKindeAtIndex:section];
}
//0,100,255,0.1
-(void) tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
  UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
  header.contentView.backgroundColor = [UIColor colorWithRed:0.19 green:0.75 blue:0.82 alpha:1.0];
  header.textLabel.textColor = [UIColor whiteColor];
  UIImageView *viewWithTag = [self.view viewWithTag:kHeaderSectionTag + section];
  if (viewWithTag) {
    [viewWithTag removeFromSuperview];
  }
  
  // add the arrow image
  CGSize headerFrame = self.view.frame.size;
  UIImageView *theImageView = [[UIImageView alloc] initWithFrame:CGRectMake(headerFrame.width - 32, 13, 18, 18)];
  theImageView.image = [UIImage imageNamed:@"Chevron-Dn-Wht"];
  theImageView.tag = kHeaderSectionTag + section;
  [header addSubview:theImageView];
  
  // make headers touchable
  header.tag = section;
  UITapGestureRecognizer *headerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderWasTouched:)];
  [header addGestureRecognizer:headerTapGesture];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ShipDataTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"shipDataCell" forIndexPath:indexPath];
  
  // Configure the cell...
  NSString *shipKind = [self.shipData getShipKindeAtIndex:indexPath.section];
  NSString *shipName = [self.shipData getShipDataAtIndex:indexPath.row withKind:shipKind];
  cell.shipName = shipName;
  [cell updateView];
  return cell;
}

- (void)sectionHeaderWasTouched:(UITapGestureRecognizer *)sender {
  UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)sender.view;
  NSInteger section = headerView.tag;
  UIImageView *eImageView = (UIImageView *)[headerView viewWithTag:kHeaderSectionTag + section];
  self.expandedSectionHeader = headerView;
  if (self.expandedSectionHeaderNumber == -1) {
    self.expandedSectionHeaderNumber = section;
    [self tableViewExpandSection:section withImage: eImageView];
  } else {
    if (self.expandedSectionHeaderNumber == section) {
      [self tableViewCollapeSection:section withImage: eImageView];
      self.expandedSectionHeader = nil;
    } else {
      UIImageView *cImageView  = (UIImageView *)[self.view viewWithTag:kHeaderSectionTag + self.expandedSectionHeaderNumber];
      [self tableViewCollapeSection:self.expandedSectionHeaderNumber withImage: cImageView];
      [self tableViewExpandSection:section withImage: eImageView];
    }
  }
}

- (void)tableViewCollapeSection:(NSInteger)section withImage:(UIImageView *)imageView {
  if ([self.shipData getShipDataCountWithKindIndex:section] == 0) {
    self.expandedSectionHeaderNumber = -1;
    return;
  } else {
    [UIView animateWithDuration:0.4 animations:^{
      imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
    }];
    NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
    for (int i=0; i< [self.shipData getShipDataCountWithKindIndex:section]; i++) {
      NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:section];
      [arrayOfIndexPaths addObject:index];
    }
    self.expandedSectionHeaderNumber = -1;
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
    [self.tableView endUpdates];
  }
}

- (void)tableViewExpandSection:(NSInteger)section withImage:(UIImageView *)imageView {
  if ([self.shipData getShipDataCountWithKindIndex:section] == 0) {
    self.expandedSectionHeaderNumber = -1;
    return;
  } else {
    [UIView animateWithDuration:0.4 animations:^{
      imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
    }];
    NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
    for (int i=0; i< [self.shipData getShipDataCountWithKindIndex:section]; i++) {
      NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:section];
      [arrayOfIndexPaths addObject:index];
    }
    self.expandedSectionHeaderNumber = section;
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
    [self.tableView endUpdates];
  }
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
