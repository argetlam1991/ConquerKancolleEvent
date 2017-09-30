//
//  DataModel.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
- (DataModel *)initWithDataFile:(NSString *)filename;
- (NSUInteger) getDataKindsCount;
- (NSString *) getDataKindeAtIndex: (NSUInteger) index;
- (NSUInteger) getDataCountWithKindIndex:(NSUInteger) index;
- (NSString *) getDataAtIndex:(NSUInteger) index withKind:(NSString *) kind;

@end
