//
//  ShipData.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/21/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipData.h"

@interface ShipData()
@property (strong, nonatomic) NSDictionary *shipData;
@property (strong, nonatomic) NSArray *shipKinds;
@end

@implementation ShipData

- (ShipData *)init {
  self = [super init];
  if (self) {
    [self getShipData];
  }
  return self;
}

- (void) getShipData {
  
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"conquerkancolleevent-shipsData" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  self.shipData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
  NSLog(@"%@", [self.shipData description]);
  self.shipKinds = [self.shipData allKeys];
}

- (NSUInteger) getShipKindsCount {
  return [self.shipKinds count];
}

- (NSUInteger) getShipDataCountWithKindIndex:(NSUInteger) index {
  NSArray *shipDataArray = self.shipData[self.shipKinds[index]];
  return [shipDataArray count];
}

- (NSString *) getShipKindeAtIndex: (NSUInteger) index {
  return self.shipKinds[index];
}

- (NSString *) getShipDataAtIndex:(NSUInteger) index withKind:(NSString *) shipKind {
  NSArray *shipDataArray = self.shipData[shipKind];
  return shipDataArray[index];
}

@end
