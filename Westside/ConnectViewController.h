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
#import "StaffDetailsViewController.h"
#define WORDPRESSFEED @"http://www.westsidebaptist.org/2011/02/art-listening/feed/rss/"

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
-(void) pushWebWithHTMLAndTitle:(NSString *)html:(NSString *)title:(NSString*)link;
-(void) pushStaffWithID:(int)ID;

@end
