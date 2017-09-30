//
//  EquipmentDataTableViewCell.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "EquipmentDataTableViewCell.h"
@interface EquipmentDataTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *equipmentLabel;

@end

@implementation EquipmentDataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) updateView {
  self.equipmentLabel.text = self.equipmentName;
}

@end
