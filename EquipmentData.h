//
//  EquipmentData.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "DataModel.h"

@interface EquipmentData : DataModel
- (EquipmentData *)init;
- (NSUInteger) getEquipmentKindsCount;
- (NSString *) getEquipmentKindeAtIndex: (NSUInteger) index;
- (NSUInteger) getEquipmentDataCountWithKindIndex:(NSUInteger) index;
- (NSString *) getEquipmentDataAtIndex:(NSUInteger) index withKind:(NSString *) equipmentKind;

@end
