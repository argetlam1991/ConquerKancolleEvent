//
//  GuidesViewController.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "GuidesViewController.h"
#import "GuidesTableViewCell.h"
#import "Guides.h"
#import "GudieEditorViewController.h"

@interface GuidesViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Guides *guides;

@end

@implementation GuidesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.guides = [[Guides alloc] init];
  
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  GuidesTableViewCell *cell = (GuidesTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"GuideIdentifier" forIndexPath:indexPath];
  // Configure the cell...
  [cell updateView];
  return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  GuideEditorViewController *child = (GuideEditorViewController *)[segue destinationViewController];
  [child receiveGuides:self.guides];
}


@end
