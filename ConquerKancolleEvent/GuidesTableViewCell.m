//
//  GuidesTableViewCell.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "GuidesTableViewCell.h"

@interface GuidesTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
@end

@implementation GuidesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) updateView {
  self.titleLabel.text = @"2017 夏活攻略";
  self.authorLabel.text = @"碧落天";
}

@end
