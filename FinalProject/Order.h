//
//  Order.h
//  TheGrabApp
//
//  Created by Safar, Karam on 4/26/16.
//  Copyright © 2016 Safar, Karam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject
@property (nonatomic, copy) NSString *orderID;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSString *specialNotes;
@property (nonatomic, copy) NSString *delivWithin;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *status;
@end
