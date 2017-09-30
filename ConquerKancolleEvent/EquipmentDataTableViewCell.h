//
//  EquipmentDataTableViewCell.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquipmentDataTableViewCell : UITableViewCell
@property (nonatomic, strong)
NSString *equipmentName;
- (void) updateView;
@end
