//
//  ShipTableViewCell.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipTableViewCell.h"

@implementation ShipTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateView {
  self.shipNameTextField.text = @"比叡";
}

@end
