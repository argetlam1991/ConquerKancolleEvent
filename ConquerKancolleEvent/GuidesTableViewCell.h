//
//  GuidesTableViewCell.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Guide.h"

@interface GuidesTableViewCell : UITableViewCell
@property (strong, nonatomic) Guide *guide;

- (void) updateView;
- (void) receiveGuide:(Guide *)guide;
@end
