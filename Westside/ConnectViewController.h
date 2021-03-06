//
//  ConnectViewController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TwitterViewController.h"
#import "GenericWebNavViewController.h"
#import "BlogPostViewController.h"
#import "StaffDetailsViewController.h"

@interface ConnectViewController : UIViewController {
@private
    TwitterViewController *twitterView;
    GenericWebNavViewController *webVC;
    StaffDetailsViewController *staffVC;
    UITableViewCell *staffCell;
    UITableView *tv;
}

@property (nonatomic, retain) TwitterViewController *twitterView;
@property (nonatomic, retain) StaffDetailsViewController *staffVC;
@property (nonatomic, retain) GenericWebNavViewController *webVC;
@property (nonatomic, retain) IBOutlet UITableViewCell *staffCell;
@property (nonatomic, retain) IBOutlet UITableView *tv;

-(void) pushWebWithLinkAndTitle:(NSString *)link:(NSString *)title;
-(void) pushStaffWithID:(int)ID;

@end
