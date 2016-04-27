//
//  addOrderViewController.m
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import "addOrderViewController.h"
#import "Order.h"

@interface addOrderViewController ()

@end

@implementation addOrderViewController
{
    NSString * _category;
}
@synthesize fireObj;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.section)
    {
        case 1:
            [self.location becomeFirstResponder];
            break;
        case 2:
            [self.orderDetail becomeFirstResponder];
            break;
        case 3:
            [self.specInstructions becomeFirstResponder];
            break;
        case 4:
            [self.delivWithin becomeFirstResponder];
            break;
        default:
            break;
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        _category = @"Food";
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc addOrderViewController");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.categoryLabel.text = _category;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickCategory"]) {
        CategoryPickerViewController *categoryPickerViewController = segue.destinationViewController;
        categoryPickerViewController.delegate = self;
        categoryPickerViewController.category = _category;
    }
}

- (void)categoryPickerViewController:(CategoryPickerViewController *)controller didSelectCategory:(NSString *)category
{
    _category = category;
    self.categoryLabel.text = _category;
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)SaveOrder:(id)sender {
    
    Order *order = [[Order alloc] init];
    order.category = _category;
    order.location = self.location.text;
    order.order = self.orderDetail.text;
    order.specialNotes = self.specInstructions.text;
    order.delivWithin = self.delivWithin.text;
    order.status = @"0";
    
    Firebase *postRef = [fireObj childByAutoId];
    
    NSDictionary *insertOrder = @{
                            @"category": _category,
                            @"from_location":self.location.text,
                            @"order":self.orderDetail.text,
                            @"special_inst":self.specInstructions.text,
                            @"del_within":self.delivWithin.text,
                            @"owner":@"me",
                            @"status":@"0"
                            };
    
    [postRef updateChildValues:insertOrder];
    [self.delegate addOrderViewController:self didAddOrder:order];
}

- (IBAction)CancelOrder:(id)sender {
    [self.delegate addOrderViewControllerDidCancel:self];
}
@end
