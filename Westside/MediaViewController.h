//
//  MediaViewController.h
//  Westside
//
//  Created by Nick Eubanks on 1/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MediaViewController : UIViewController {
@private
    
    UIView *MediaView;
    UISegmentedControl *MediaSegmentedControl;
}

@property (nonatomic, retain) IBOutlet UIView *MediaView;

- (IBAction)ViewChangeRequest:(id)sender;

@property (nonatomic, retain) IBOutlet UISegmentedControl *MediaSegmentedControl;

@end
