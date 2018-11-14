//
//  ViewController.m
//  DBWithJSON
//
//  Created by SHS on 11/14/18.
//  Copyright © 2018 SHS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadDataFromStorage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadDataFromStorage
{
    NSUserDefaults *myData = [NSUserDefaults standardUserDefaults];
    
    if([myData arrayForKey:@"medicines"] != nil)
    {
        NSMutableArray *temp = [NSMutableArray arrayWithArray:[myData arrayForKey:@"medicines"]];
        _myArray = temp;
    }
}

-(void) saveDataToStorage
{
    NSUserDefaults *myData = [NSUserDefaults standardUserDefaults];
    
    NSArray *justArray = [[NSArray alloc]initWithArray:_myArray];
    
    [myData setObject:justArray forKey:@"medicines"];
    
    [myData synchronize];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"TVC"])
    {
        TargetViewController *myTVC = (TargetViewController *) [segue.destinationViewController topViewController];
        myTVC.tvcdelegate = self; //Assign this ViewController to tvcdelegate for calling function to reload TableView data
        myTVC.viewController = self;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return !_myArray ? 0 : _myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyCustomCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    
    if(_myArray)
    {
        NSDictionary *dict = _myArray[indexPath.row];
    
        cell.medicineName.text = [dict objectForKey:@"name"];
        cell.quantityTimeState.text = @"2 + 0 + 2";
        cell.eatingState.text = @"After Eating";
    }
    else
    {
        cell.textLabel.text = @"abc";
        cell.detailTextLabel.text = @"shs";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_myArray removeObjectAtIndex:indexPath.row];
        [_myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self saveDataToStorage];
    }
}

//implement delegate of TargetViewController
- (void)didUpdateData
{
    [_myTableView reloadData];
    
    [self saveDataToStorage];
}


@end
