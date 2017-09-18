//
//  GudieEditorViewController.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Guides.h"

@interface GuideEditorViewController : UIViewController
- (void) receiveGuides:(Guides *) guides;
- (void) receiveGuide:(Guide *)guide;
@end
