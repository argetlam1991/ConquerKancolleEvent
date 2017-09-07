//
//  Guide.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/27/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Guide.h"

@implementation Guide
- (Guide *) initWithEmptyFleet {
  self = [super init];
  if (self) {
    self.fleet = [NSMutableArray arrayWithCapacity:12];
  }
  return self;
}

- (void) setShip:(Ship *)ship AtIndex:(NSUInteger)index {
  if (index < [self.fleet count]) {
    self.fleet[index] = ship;
  } else {
    [self.fleet addObject:ship];
  }
}

- (Ship *) getShipAtIndex:(NSUInteger)index {
  if (index < [self.fleet count]) {
    return self.fleet[index];
  } else {
    return nil;
  }
}

- (NSDictionary *) convertToFirebaseValue {
  NSMutableArray *fleetArray = [[NSMutableArray alloc] init];
  for (Ship *ship in self.fleet) {
    [fleetArray addObject:[ship convertToFirebaseValue]];
  }
  NSDictionary *value = @{@"title" : self.title,
                          @"description": self.guideDescription,
                          @"fleet": (NSArray *)[fleetArray copy],
                          };
  return value;
}

@end
