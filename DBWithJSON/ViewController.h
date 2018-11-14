//
//  ViewController.h
//  DBWithJSON
//
//  Created by SHS on 11/14/18.
//  Copyright © 2018 SHS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TargetViewController.h"
#import "MyTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, TargetViewDelegate>

@property NSMutableArray *myArray;

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

