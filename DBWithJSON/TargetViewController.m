//
//  TargetViewController.m
//  DBWithJSON
//
//  Created by SHS on 11/14/18.
//  Copyright © 2018 SHS. All rights reserved.
//

#import "TargetViewController.h"
#import "ViewController.h"

@interface TargetViewController ()

@end

@implementation TargetViewController

@synthesize tvcdelegate; //Warning of delegate

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self.tvcdelegate didUpdateData]; //Fire the delegate before dismissing
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveAction:(UIBarButtonItem *)sender {
    
    if(!_viewController.myArray)
    {
        NSMutableArray *temp = [NSMutableArray arrayWithObject:@{@"name" : @"Shayed Hasan", @"roll" : @"13", @"age": @"15"}];
        _viewController.myArray = temp;
    }
    else
    {
        [_viewController.myArray addObject:@{@"name" : @"Shayed Hasan", @"roll" : @"13", @"age" : @"15"}];
    }
    NSLog(@"%lu",(unsigned long)[_viewController.myArray count]);
}
@end
