//
//  Guide.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/27/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Guide.h"
@import Firebase;

@implementation Guide
- (Guide *) initWithEmptyFleet {
  self = [super init];
  if (self) {
    self.fleet = [NSMutableArray arrayWithCapacity:12];
    self.authorName =[FIRAuth auth].currentUser.displayName;
  }
  return self;
}
- (Guide *) initWithFirebaseValue:(NSDictionary *)value withID:(NSString *)ID{
  self = [super init];
  if (self) {
    self.guideID = ID;
    self.title = value[@"title"];
    self.authorName = value[@"author"];
    self.guideDescription = value[@"description"];
    self.fleet = [NSMutableArray arrayWithCapacity:12];
    for (NSDictionary *shipValue in value[@"fleet"]) {
      [self.fleet addObject:[[Ship alloc] initWithFirebaseValue:shipValue]];
    }
  }
  return self;
}


- (NSDictionary *) convertToFirebaseValue {
  NSMutableArray *fleetArray = [[NSMutableArray alloc] init];
  for (Ship *ship in self.fleet) {
    [fleetArray addObject:[ship convertToFirebaseValue]];
  }
  NSDictionary *value = @{@"title" : self.title,
                          @"description": self.guideDescription,
                          @"fleet": (NSArray *)[fleetArray copy],
                          @"author": self.authorName,
                          };
  return value;
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


@end
