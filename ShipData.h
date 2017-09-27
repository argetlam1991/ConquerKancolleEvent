//
//  ShipData.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/21/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShipData : NSObject
- (ShipData *)init;
- (NSUInteger) getShipKindsCount;
- (NSString *) getShipKindeAtIndex: (NSUInteger) index;
- (NSUInteger) getShipDataCountWithKindIndex:(NSUInteger) index;
- (NSString *) getShipDataAtIndex:(NSUInteger) index withKind:(NSString *) shipKind;

@end
