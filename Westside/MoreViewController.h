//
//  WestsideViewController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GenericWebNavViewController.h"
#define PICTURES 5

@interface MoreViewController : UIViewController {
@private
    
    UIImageView *imageBanner;
    GenericWebNavViewController *webVC;
    UITableView *tv;
}
@property (nonatomic, retain) IBOutlet UITableView *tv;

@property (nonatomic, retain) GenericWebNavViewController *webVC;
@property (nonatomic, retain) IBOutlet UIImageView *imageBanner;
- (IBAction)directions:(id)sender;
- (IBAction)egiving:(id)sender;

@end
