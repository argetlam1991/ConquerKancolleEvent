//
//  EquipmentDataViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "EquipmentDataViewController.h"
#import "EquipmentDataTableViewCell.h"
#import "EquipmentData.h"
#import "Ship.h"

const NSUInteger lHeaderSectionTag = 10000;

@interface EquipmentDataViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) EquipmentData *equipmentData;
@property (assign) NSInteger expandedSectionHeaderNumber;
@property (assign) UITableViewHeaderFooterView *expandedSectionHeader;

@property (nonatomic, strong) Ship *ship;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end

@implementation EquipmentDataViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.equipmentData = [[EquipmentData alloc] init];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  return 45.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.equipmentData getEquipmentKindsCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (self.expandedSectionHeaderNumber == section) {
    return [self.equipmentData getEquipmentDataCountWithKindIndex:section];
  } else {
    return 0;
  }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return [self.equipmentData getEquipmentKindeAtIndex:section];
}

-(void) tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
  UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
  header.contentView.backgroundColor = [UIColor colorWithRed:0.19 green:0.75 blue:0.82 alpha:1.0];
  header.textLabel.textColor = [UIColor whiteColor];
  UIImageView *viewWithTag = [self.view viewWithTag:lHeaderSectionTag + section];
  if (viewWithTag) {
    [viewWithTag removeFromSuperview];
  }
  
  // add the arrow image
  CGSize headerFrame = self.view.frame.size;
  UIImageView *theImageView = [[UIImageView alloc] initWithFrame:CGRectMake(headerFrame.width - 32, 13, 18, 18)];
  theImageView.image = [UIImage imageNamed:@"Chevron-Dn-Wht"];
  theImageView.tag = lHeaderSectionTag + section;
  [header addSubview:theImageView];
  
  // make headers touchable
  header.tag = section;
  UITapGestureRecognizer *headerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderWasTouched:)];
  [header addGestureRecognizer:headerTapGesture];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  EquipmentDataTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"equipmentDataCell" forIndexPath:indexPath];
  
  // Configure the cell...
  NSString *equipmentKind = [self.equipmentData getEquipmentKindeAtIndex:indexPath.section];
  NSString *equipmentName = [self.equipmentData getEquipmentDataAtIndex:indexPath.row withKind:equipmentKind];
  cell.equipmentName = equipmentName;
  [cell updateView];
  return cell;
}

- (void)sectionHeaderWasTouched:(UITapGestureRecognizer *)sender {
  UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)sender.view;
  NSInteger section = headerView.tag;
  UIImageView *eImageView = (UIImageView *)[headerView viewWithTag:lHeaderSectionTag + section];
  self.expandedSectionHeader = headerView;
  if (self.expandedSectionHeaderNumber == -1) {
    self.expandedSectionHeaderNumber = section;
    [self tableViewExpandSection:section withImage: eImageView];
  } else {
    if (self.expandedSectionHeaderNumber == section) {
      [self tableViewCollapeSection:section withImage: eImageView];
      self.expandedSectionHeader = nil;
    } else {
      UIImageView *cImageView  = (UIImageView *)[self.view viewWithTag:lHeaderSectionTag + self.expandedSectionHeaderNumber];
      [self tableViewCollapeSection:self.expandedSectionHeaderNumber withImage: cImageView];
      [self tableViewExpandSection:section withImage: eImageView];
    }
  }
}

- (void)tableViewCollapeSection:(NSInteger)section withImage:(UIImageView *)imageView {
  if ([self.equipmentData getEquipmentDataCountWithKindIndex:section] == 0) {
    self.expandedSectionHeaderNumber = -1;
    return;
  } else {
    [UIView animateWithDuration:0.4 animations:^{
      imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
    }];
    NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
    for (int i=0; i< [self.equipmentData getEquipmentDataCountWithKindIndex:section]; i++) {
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
  if ([self.equipmentData getEquipmentDataCountWithKindIndex:section] == 0) {
    self.expandedSectionHeaderNumber = -1;
    return;
  } else {
    [UIView animateWithDuration:0.4 animations:^{
      imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
    }];
    NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
    for (int i=0; i< [self.equipmentData getEquipmentDataCountWithKindIndex:section]; i++) {
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
