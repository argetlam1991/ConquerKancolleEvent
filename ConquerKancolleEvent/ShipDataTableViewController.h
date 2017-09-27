//
//  ShipDataTableViewController.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/23/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShipEditorViewController.h"
#import "Ship.h"
#import "ShipHandler.h"


@interface ShipDataTableViewController : UITableViewController
@property (weak, nonatomic) NSObject<ShipHandler> *delegate;

- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath;

@end
