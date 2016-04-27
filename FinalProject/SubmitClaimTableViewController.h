//
//  SubmitClaimTableViewController.h
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@class SubmitClaimTableViewController;

@protocol SubmitClaimTableViewControllerDelegate <NSObject>
- (void)SubmitClaimTableViewControllerDidCancel:(SubmitClaimTableViewController *)controller;
@end

@interface SubmitClaimTableViewController : UITableViewController

@property (nonatomic, weak) id <SubmitClaimTableViewControllerDelegate> delegate;
@property (nonatomic, strong) Order* order;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userAddress;
@property (weak, nonatomic) IBOutlet UILabel *userAddress2;
@property (weak, nonatomic) IBOutlet UILabel *userRating;
@property (weak, nonatomic) IBOutlet UITextField *message;

- (IBAction)cancel:(id)sender;
- (IBAction)submit:(id)sender;
@end
