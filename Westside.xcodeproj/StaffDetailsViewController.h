//
//  StaffDetailsViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GenericWebNavViewController.h"

@interface StaffDetailsViewController : UIViewController {
    UITableView *tv;
    UIImageView *image;
    UILabel *nameLabel;
    UILabel *titleLabel;
    NSString *twitter;
    NSString *facebook;
    NSString *email;
    NSString *title;
    NSString *name;
    NSString *imgPath;
    GenericWebNavViewController *webVC;
}
@property (nonatomic, retain) IBOutlet UITableView *tv;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) GenericWebNavViewController *webVC;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
- (id)initWithID:(int)ID;
-(void) pushWebWithLinkAndTitle:(NSString *)link:(NSString *)nav_title;

@end
