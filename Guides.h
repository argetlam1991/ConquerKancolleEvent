//
//  Guides.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/5/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guide.h"
#import "GuidesDelegate.h"


@interface Guides : NSObject
@property (weak, nonatomic) id<GuidesDelegate> delegate;

- (void) addGuide:(Guide *) guide;
- (void) getGuides;
- (void)configureDatabase;
- (NSUInteger) getGuidesCount;
- (Guide *) getGuideAtIndex:(NSUInteger)index;
- (void) increaseCapacity;
@end
