//
//  Ship.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/24/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Ship.h"

@implementation Ship

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
