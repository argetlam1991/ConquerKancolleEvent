//
//  ShipData.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/21/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipData.h"


@implementation ShipData

- (ShipData *)init {
  self = [super initWithDataFile:@"conquerkancolleevent-shipsData"];
  return self;
}

- (NSUInteger) getShipKindsCount {
  return [self getDataKindsCount];
}

- (NSUInteger) getShipDataCountWithKindIndex:(NSUInteger) index {
  return [self getDataCountWithKindIndex:index];
}

- (NSString *) getShipKindeAtIndex: (NSUInteger) index {
  return [self getDataKindeAtIndex:index];
}

- (NSString *) getShipDataAtIndex:(NSUInteger) index withKind:(NSString *) shipKind {
  return [self getDataAtIndex:index withKind:shipKind];
}

@end
