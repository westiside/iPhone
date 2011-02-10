//
//  MoreTabViewController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericWebNavViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MoreTabViewController : UIViewController {
@private
    
    GenericWebNavViewController *webVC;
}

@property (nonatomic, retain) GenericWebNavViewController *webVC;

- (IBAction)eGiveBtnPress:(id)sender;
- (IBAction)webBtnPress:(id)sender;
- (IBAction)directionsBtnPress:(id)sender;


@end
