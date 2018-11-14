//
//  TargetViewController.h
//  DBWithJSON
//
//  Created by SHS on 11/14/18.
//  Copyright © 2018 SHS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class ViewController;

@protocol TargetViewDelegate <NSObject>
- (void) didUpdateData;
@end

@interface TargetViewController : UIViewController {
    __unsafe_unretained id tvcdelegate;
}

@property (nonatomic, assign) id <TargetViewDelegate> tvcdelegate;

@property (nonatomic, strong) ViewController *viewController;

- (IBAction)cancelAction:(UIBarButtonItem *)sender;
- (IBAction)saveAction:(UIBarButtonItem *)sender;

@end
