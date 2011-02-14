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
#import <Mapkit/Mapkit.h>

@interface MoreViewController : UIViewController {
@private
    
    UIImageView *imageBanner;
    GenericWebNavViewController *webVC;
    MKMapView *map;
}

@property (nonatomic, retain) GenericWebNavViewController *webVC;
@property (nonatomic, retain) IBOutlet UIImageView *imageBanner;
- (IBAction)directions:(id)sender;
- (IBAction)egiving:(id)sender;
@property (nonatomic, retain) IBOutlet MKMapView *map;

@end