//
//  Guides.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/5/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Guides.h"

@import Firebase;
@interface Guides() {
  FIRDatabaseHandle _refHandle;
}

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation Guides

- (Guides *)init {
  self = [super init];
  if (self) {
    self.ref = [[FIRDatabase database] reference];
  }
  return self;
}

- (void)configureDatabase {
  self.ref = [[FIRDatabase database] reference];
  _refHandle = [[_ref child:@"guides"] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
                {
                  NSLog(@"%@", snapshot.key);
                }];
}

- (void) addGuide:(Guide *) guide {
  [[[_ref child:@"guides"] childByAutoId] setValue:[guide convertToFirebaseValue]];
}

@end
