//
//  addOrderViewController.h
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import "CategoryPickerViewController.h"

@class addOrderViewController;
@class Order;

@protocol addOrderViewControllerDelegate <NSObject>
- (void)addOrderViewControllerDidCancel:(addOrderViewController *)controller;
- (void)addOrderViewController:(addOrderViewController *)controller didAddOrder:(Order *)order;
@end

@interface addOrderViewController : UITableViewController <CategoryPickerViewControllerDelegate>

@property (nonatomic, weak) id <addOrderViewControllerDelegate> delegate;
@property (strong, nonatomic) Firebase * fireObj;

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UITextField *orderDetail;
@property (weak, nonatomic) IBOutlet UITextField *specInstructions;
@property (weak, nonatomic) IBOutlet UITextField *delivWithin;

- (IBAction)SaveOrder:(id)sender;
- (IBAction)CancelOrder:(id)sender;

@end
