//
//  ShipTableViewCell.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ship.h"

@interface ShipTableViewCell : UITableViewCell

@property (strong, nonatomic) Ship *ship;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) IBOutlet UILabel *shipNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *equipment1Label;
@property (strong, nonatomic) IBOutlet UILabel *equipment2Label;
@property (strong, nonatomic) IBOutlet UILabel *equipment3Label;

@property (strong, nonatomic) IBOutlet UILabel *equipment4Label;
@property (strong, nonatomic) IBOutlet UILabel *equipment5Label;

- (void) updateView;
@end
