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
  if(self.ship) {
    self.shipNameLabel.text = self.ship.shipName;
    self.equipment1Label.text = self.ship.equipment1;
    self.equipment2Label.text = self.ship.equipment2;
    self.equipment3Label.text = self.ship.equipment3;
    self.equipment4Label.text = self.ship.equipment4;
    self.equipment5Label.text = self.ship.equipment5;
  } else {
    self.shipNameLabel.text = @"空";
    self.equipment1Label.text = @"空";
    self.equipment2Label.text = @"空";
    self.equipment3Label.text = @"空";
    self.equipment4Label.text = @"空";
    self.equipment5Label.text = @"空";
    
  }
}

- (void) receiveShip:(Ship *)ship {
  self.ship = ship;
  [self updateView];
}

@end
