//
//  Guides.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/5/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Guides.h"


#define CAPACITY 10;

@import Firebase;
@interface Guides() {
  FIRDatabaseHandle _refHandle;
}

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (nonatomic) NSUInteger capacity;
@property (strong, nonatomic) NSMutableArray *guidesArray;
@end

@implementation Guides

- (Guides *)init {
  self = [super init];
  if (self) {
    self.ref = [[FIRDatabase database] reference];
    self.capacity = CAPACITY;
    self.guidesArray = [NSMutableArray arrayWithCapacity:self.capacity];
  }
  return self;
}

- (void)configureDatabase {
  self.ref = [[FIRDatabase database] reference];
}

- (void) getGuides {
  [[[_ref child:@"guides"] queryLimitedToFirst:self.capacity] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
   {
     NSDictionary *value = snapshot.value;
     NSLog(@"%@", [value description]);
     if (![value isKindOfClass:[NSNull class]]) {
       [self.guidesArray removeAllObjects];
       for (NSString *key in value) {
         NSDictionary *guideValue = value[key];
         if (guideValue) {
           [self.guidesArray addObject:[[Guide alloc] initWithFirebaseValue:guideValue withID:key]];
         }
       }
     }
     [self.delegate receiveGuidesUpdate];
   } withCancelBlock:^(NSError * _Nonnull error) {
     NSLog(@"%@", error.localizedDescription);
   }];
}
- (NSUInteger) getGuidesCount {
  return [self.guidesArray count];
}

- (Guide *) getGuideAtIndex:(NSUInteger)index {
  return self.guidesArray[index];
}

- (void) addGuide:(Guide *) guide {
  if(guide.guideID) {
    [[[_ref child:@"guides"] child:guide.guideID] removeValue];
  }
  [[[_ref child:@"guides"] childByAutoId] setValue:[guide convertToFirebaseValue]];
  [self getGuides];
}

- (void) increaseCapacity {
  self.capacity += 10;
}
@end
