//
//  ShipDataTableViewCell.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/23/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShipDataTableViewCell : UITableViewCell
@property (nonatomic, strong) NSString *shipName;
- (void) updateView;
@end
