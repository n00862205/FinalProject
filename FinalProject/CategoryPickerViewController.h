//
//  CategoryPickerViewController.h
//  FinalProject
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryPickerViewController;

@protocol CategoryPickerViewControllerDelegate <NSObject>
- (void)categoryPickerViewController:(CategoryPickerViewController *)controller didSelectCategory:(NSString *)category;
@end

@interface CategoryPickerViewController : UITableViewController

@property (nonatomic, weak) id <CategoryPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *category;


@end
