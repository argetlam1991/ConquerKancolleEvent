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
#import "GuidesDelegate.h"

@interface GuidesViewController () <UITableViewDelegate, UITableViewDataSource, GuidesDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (atomic) BOOL isLoading;
@property (strong, nonatomic) Guides *guides;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation GuidesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.guides = [[Guides alloc] init];
  [self.guides configureDatabase];
  self.guides.delegate = self;
  [self.guides getGuides];
  UITableViewController *tableViewController = [[UITableViewController alloc] init];
  tableViewController.tableView = self.tableView;
  
  //refreshControl
  self.isLoading = NO;
  self.refreshControl = [[UIRefreshControl alloc] init];
  [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
  tableViewController.refreshControl = self.refreshControl;
  [self initializeRefreshControl];
  
}

-(void)refreshTable {
    [self.guides getGuides];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.guides getGuidesCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  GuidesTableViewCell *cell = (GuidesTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"GuideIdentifier" forIndexPath:indexPath];
  // Configure the cell...
  [cell receiveGuide:[self.guides getGuideAtIndex:indexPath.row]];
  return cell;
}

- (IBAction)getGuides:(UIBarButtonItem *)sender {
  [self.guides getGuides];
}

-(void)initializeRefreshControl
{
  UIActivityIndicatorView *indicatorFooter = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 44)];
  [indicatorFooter setColor:[UIColor blackColor]];
  [indicatorFooter startAnimating];
  [self.tableView setTableFooterView:indicatorFooter];
}

- (void)receiveGuidesUpdate {
  [self.tableView reloadData];
  [self.refreshControl endRefreshing];
  self.isLoading = NO;
}



-(void)scrollViewDidScroll: (UIScrollView*)scrollView
{
      NSLog(@"%f, %f, %f",  scrollView.contentOffset.y, scrollView.frame.size.height, scrollView.contentSize.height);
  if (!self.isLoading && scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height)
  {
    self.isLoading = YES;
    [self.guides increaseCapacity];
    [self refreshTable];
  }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  GuideEditorViewController *child = (GuideEditorViewController *)[segue destinationViewController];
  if ([sender isKindOfClass:[GuidesTableViewCell class]]) {
    GuidesTableViewCell *source = (GuidesTableViewCell *)sender;
    [child receiveGuide:source.guide];
  }
  [child receiveGuides:self.guides];

}


@end
