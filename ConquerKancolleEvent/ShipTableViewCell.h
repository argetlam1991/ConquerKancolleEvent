//
//  ShipTableViewCell.h
//  ConquerKancolleEvent
//
//  Created by Gu Han on 8/20/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShipTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *shipNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment1TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment2TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment3TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment4TextField;
@property (strong, nonatomic) IBOutlet UITextField *equipment5TextField;

- (void) updateView;
@end
