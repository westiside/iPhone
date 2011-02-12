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

@interface MinistriesTabViewController : UIViewController {
@private
    
    GenericWebNavViewController *webVC;
}

@property (nonatomic, retain) GenericWebNavViewController *webVC;


- (void)webWithLinkAndTitle:(NSString *)link:(NSString *)title;


@end
