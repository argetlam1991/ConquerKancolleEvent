//
//  ShipHandler.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/24/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ship.h"


@protocol ShipHandler <NSObject>

- (void) receiveShip:(Ship *) ship AtIndexPath:(NSIndexPath *) indexPath;

@end
