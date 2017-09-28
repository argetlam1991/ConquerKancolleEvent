//
//  ShipDataViewController.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/26/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ship.h"
#import "ShipHandler.h"

@interface ShipDataViewController : UIViewController
@property (weak, nonatomic) NSObject<ShipHandler> *delegate;
- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath;

@end
