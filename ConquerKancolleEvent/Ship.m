//
//  Ship.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/24/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Ship.h"

@implementation Ship

- (Ship *)initWithFirebaseValue:(NSDictionary *)value {
  self = [super init];
  if (self) {
    self.shipName = value[@"shipName"];
    self.equipment1 = value[@"equipment1"];
    self.equipment2 = value[@"equipment2"];
    self.equipment3 = value[@"equipment3"];
    self.equipment4 = value[@"equipment4"];
    self.equipment5 = value[@"equipment5"];
  }
  return self;
}


- (NSDictionary *)convertToFirebaseValue {
  NSDictionary *value = @{@"shipName" : self.shipName,
                          @"equipment1": self.equipment1,
                          @"equipment2": self.equipment2,
                          @"equipment3": self.equipment3,
                          @"equipment4": self.equipment4,
                          @"equipment5": self.equipment5,
                          };
  return value;
}

@end
