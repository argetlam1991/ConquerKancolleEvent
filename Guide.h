//
//  Guide.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/27/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ship.h"

@interface Guide : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *guideDescription;
@property (strong, nonatomic) NSMutableArray *fleet;
- (Guide *) initWithEmptyFleet;
- (void) setShip:(Ship *) ship AtIndex:(NSUInteger) index;
- (Ship *) getShipAtIndex:(NSUInteger) index;
@end
