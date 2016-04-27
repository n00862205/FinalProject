//
//  FirstViewController.h
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import "addOrderViewController.h"
#import "OrderDetailsViewController.h"
#import "Order.h"
#import "OrderCell.h"


@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *orderTableView;
@property (strong, nonatomic) Firebase *myRootRef;

@end

