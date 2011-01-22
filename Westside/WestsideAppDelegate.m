//
//  WestsideAppDelegate.m
//  Westside
//
//  Created by Nick Eubanks on 1/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WestsideAppDelegate.h"



@implementation WestsideAppDelegate
@synthesize mediaSegmentedControl;
@synthesize webView;
@synthesize audioURL;
@synthesize videoURL;
@synthesize window;
@synthesize tabBarController;
@synthesize mediaNavigationController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [tabBarController release];
    [mediaSegmentedControl release];
    [mediaNavigationController release];
    [webView release];
    [audioURL release];
    [videoURL release];
    [super dealloc];
}

- (IBAction)MediaViewChangeRequested:(id)sender {
    NSLog(@"Media View Change Requested");
    
    int viewRequest = [mediaSegmentedControl selectedSegmentIndex];
    
    //TEST:
    audioURL = @"http://sermonplayer.com/download_rss/25554-rss-2584341-1.mp3";
    videoURL = @"http://sermonplayer.com/download_rss/25554-rss-2584341-3.mp4";
    
    switch(viewRequest){
        case 0 :    //Audio
        {
            if(audioURL != nil){
                [self loadPodcast:audioURL];
            }
            break;
        }
        case 1  :   //Video
        {
            if(videoURL != nil){
                [self loadPodcast:videoURL];
            }
            break;
        }
        case 2  :   //Live
        {
            //Checking for Live Feed
            NSURL *liveFeed = [NSURL URLWithString:@"http://wbcmedia.sermon.net/l/main"];
            NSString *data = [NSString stringWithContentsOfURL:liveFeed encoding:NSStringEncodingConversionAllowLossy error:nil];
            if(![data compare:@"No on air lives"]){
                NSLog(@"No Live Feed");
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Live Feed Off-Air" message:@"Check back on Sunday at 9:15am, 10:45am, and 6:00pm" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                [alert release];
                                
            } else{
                //is a live feed
                [self loadPodcast:@"http://wbcmedia.sermon.net/l/main"];
            }
            
            break;
        }
            
    }

}

- (void)loadPodcast:(NSString *)string{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:string]]];
}

@end
