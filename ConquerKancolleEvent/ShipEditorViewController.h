//
//  ShipEditorViewController.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/24/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ship.h"
#import "ShipHandler.h"

@interface ShipEditorViewController : UIViewController
@property (weak, nonatomic) NSObject<ShipHandler> *delegate;

- (void) receiveShip:(Ship *)ship AtIndexPath:(NSIndexPath *)indexPath;

@end
