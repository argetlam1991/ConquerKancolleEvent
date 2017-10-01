//
//  EquipmentData.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "EquipmentData.h"

@implementation EquipmentData
- (EquipmentData *)init {
  self = [super initWithDataFile:@"conquerkancolleevent-equipments"];
  return self;
}

- (NSUInteger) getEquipmentKindsCount {
  return [self getDataKindsCount];
}

- (NSString *) getEquipmentKindeAtIndex: (NSUInteger) index {
  return [self getDataKindeAtIndex:index];
}

- (NSUInteger) getEquipmentDataCountWithKindIndex:(NSUInteger) index {
  return [self getDataCountWithKindIndex:index];
}

- (NSString *) getEquipmentDataAtIndex:(NSUInteger) index withKind:(NSString *) equipmentKind {
  return [self getDataAtIndex:index withKind:equipmentKind];
}

@end
