//
//  OrderDetailsViewController.h
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubmitClaimTableViewController.h"
#import "Order.h"

@class OrderDetailsViewController;

@protocol orderDetailsViewControllerDelegate <NSObject>
- (void)OrderDetailsViewControllerDidCancel:(OrderDetailsViewController *)controller;
@end

@interface OrderDetailsViewController : UITableViewController

@property (nonatomic, weak) id <orderDetailsViewControllerDelegate> delegate;

@property (nonatomic, strong) Order* order;
@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLocation;
@property (weak, nonatomic) IBOutlet UILabel *orderDetails;
@property (weak, nonatomic) IBOutlet UILabel *specialInstructions;
@property (weak, nonatomic) IBOutlet UILabel *deliverWithin;

- (IBAction)cancel:(id)sender;


@end
