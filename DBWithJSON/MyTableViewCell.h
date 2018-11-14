//
//  MyTableViewCell.h
//  DBWithJSON
//
//  Created by SHS on 11/14/18.
//  Copyright © 2018 SHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *medicineName;
@property (strong, nonatomic) IBOutlet UILabel *quantityTimeState;
@property (strong, nonatomic) IBOutlet UILabel *eatingState;
- (IBAction)toggleAlarmAction:(UISwitch *)sender;

@end
