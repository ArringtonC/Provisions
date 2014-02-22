//
//  ChurchMessageViewController.h
//  Provisions
//
//  Created by Arrington Copeland on 2/15/14.
//  Copyright (c) 2014 Arrington Copeland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ChurchMessageViewController : UITableViewController
@property(strong, nonatomic) NSArray *titlesArray;
@property(strong, nonatomic) NSMutableArray *titleArray;

@end
