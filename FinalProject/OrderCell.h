//
//  OrderCell.h
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;
@property (weak, nonatomic) IBOutlet UILabel *orderDetail;
@property (weak, nonatomic) IBOutlet UILabel *orderLocation;

@end
