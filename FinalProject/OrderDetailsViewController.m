//
//  OrderDetailsViewController.m
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import "OrderDetailsViewController.h"

@interface OrderDetailsViewController ()

@end

@implementation OrderDetailsViewController
@synthesize order;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoryImage.image = [self imageForName:order.category];
    self.categoryLabel.text = order.category;
    self.fromLocation.text = order.location;
    self.orderDetails.text = order.order;
    self.specialInstructions.text = order.specialNotes;
    self.deliverWithin.text = order.delivWithin;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SubmitClaim"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        SubmitClaimTableViewController *submitClaimTableViewController = [navigationController viewControllers][0];
        submitClaimTableViewController.order = self.order;
        submitClaimTableViewController.delegate = self;
    }
}

- (void)SubmitClaimTableViewControllerDidCancel:(SubmitClaimTableViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate OrderDetailsViewControllerDidCancel:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.delegate OrderDetailsViewControllerDidCancel:self];
}

@end
