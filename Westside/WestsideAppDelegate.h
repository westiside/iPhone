//
//  WestsideAppDelegate.h
//  Westside
//
//  Created by Nick Eubanks on 1/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WestsideAppDelegate : NSObject <UIApplicationDelegate> {
@private

    UITabBarController *tabBarController;
    UISegmentedControl *mediaSegmentedControl;
    UIWebView *webView;
    UINavigationBar *mediaNavigationBar;
    
}

@property (nonatomic, retain) IBOutlet UINavigationController *mediaNavigationController;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

- (IBAction)MediaViewChangeRequested:(id)sender;
- (void) loadPodcast:(NSString *)string;

@property (nonatomic, retain) IBOutlet UISegmentedControl *mediaSegmentedControl;

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@property (nonatomic, retain) NSString *audioURL;
@property (nonatomic, retain) NSString *videoURL;

@end
