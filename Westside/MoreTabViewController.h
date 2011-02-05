//
//  MoreTabViewController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "GenericWebNavViewController.h"

@interface MoreTabViewController : UIViewController {
@private
    
    MKMapView *map;
    GenericWebNavViewController *webVC;
}

@property (nonatomic, retain) IBOutlet MKMapView *map;
@property (nonatomic, retain) GenericWebNavViewController *webVC;

- (IBAction)eGiveBtnPress:(id)sender;

@end
