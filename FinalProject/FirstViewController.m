//
//  FirstViewController.m
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
{
    NSMutableArray *_orders;
}
@synthesize myRootRef;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    myRootRef = [[Firebase alloc] initWithUrl:@"graby.firebaseIO.com"];
    _orders= [NSMutableArray arrayWithCapacity:100];
    
    Order *order = [[Order alloc] init];
    order.orderID = @"1";
    order.category = @"Food";
    order.location = @"McDonalds";
    order.order = @"2 McChicken";
    order.specialNotes = @"Raw please";
    order.delivWithin = @"30";
    order.userId = @"1";
    order.status = @"0";
    [_orders addObject:order];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_orders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"OrderCell";
    
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    Order *order = _orders[indexPath.row];
    cell.orderDetail.text = order.order;
    cell.orderLocation.text = order.location;
    cell.categoryImage.image = [self imageForName:order.category];
    
    return cell;
}

- (UIImage *)imageForName:(NSString*)name
{
    if([name  isEqual: @"Food"]) {
        return [UIImage imageNamed:@"Food"];
    }
    else if( [name  isEqual: @"Work"]){
        //return [UIImage imageNamed:@""];
    }
    else if( [name  isEqual: @"Groceries"]){
        //return [UIImage imageNamed:@""];
    }
    else if( [name  isEqual: @"Medicine"]){
        //return [UIImage imageNamed:@""];
    }
    else if( [name  isEqual: @"Video Games"]){
        //return [UIImage imageNamed:@""];
    }
    else {
        //return [UIImage imageNamed:@""];
    }
    return nil;
    
}

- (void)addOrderViewControllerDidCancel:(addOrderViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)OrderDetailsViewControllerDidCancel:(OrderDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddOrder"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        addOrderViewController *addOrderViewController = [navigationController viewControllers][0];
        addOrderViewController.fireObj = myRootRef;
        addOrderViewController.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"OrderDetails"]) {
        NSIndexPath *indexPath = [self.orderTableView indexPathForSelectedRow];
        UINavigationController *navigationController = segue.destinationViewController;
        OrderDetailsViewController *orderDetailsViewController = [navigationController viewControllers][0];
        orderDetailsViewController.order = _orders[indexPath.row];
        orderDetailsViewController.delegate = self;
    }
}

- (void)addOrderViewController:(addOrderViewController *)controller didAddOrder:(Order *)order
{
    [_orders addObject:order];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([_orders count] - 1) inSection:0];
    [self.orderTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
