//
//  SubmitClaimTableViewController.m
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import "SubmitClaimTableViewController.h"

@interface SubmitClaimTableViewController ()

@end

@implementation SubmitClaimTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userName.text = @"Kenneth Koumoin";
    self.userAddress.text = @"3522 Imagiary Drive South";
    self.userAddress2.text = @"Apt. 5";
    self.userRating.text = @"Excellent";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.section)
    {
        case 5:
            [self.message becomeFirstResponder];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.delegate SubmitClaimTableViewControllerDidCancel:self];
}

- (IBAction)submit:(id)sender {
}
@end
