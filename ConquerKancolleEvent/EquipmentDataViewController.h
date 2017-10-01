//
//  EquipmentDataViewController.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ship.h"
#import "ShipHandler.h"

@interface EquipmentDataViewController : UIViewController
@property (weak, nonatomic) NSObject<ShipHandler> *delegate;
- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath;
- (void) receiveButtonIdentify:(NSString *)identify;

@end
