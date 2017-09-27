//
//  ShipDataTableViewCell.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/23/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ShipDataTableViewCell.h"
@interface ShipDataTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *shipNameLabel;

@end

@implementation ShipDataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void) updateView {
  self.shipNameLabel.text = self.shipName;
}


@end
