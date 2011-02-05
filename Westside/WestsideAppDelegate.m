//
//  WestsideAppDelegate.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "WestsideAppDelegate.h"


@implementation WestsideAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize connectNav;
@synthesize mediaTabBarItem;
@synthesize moreNav;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    //Check for Live Feed
    NSURL *liveFeed = [NSURL URLWithString:@"http://wbcmedia.sermon.net/l/main"];
    NSString *data = [NSString stringWithContentsOfURL:liveFeed encoding:NSStringEncodingConversionAllowLossy error:nil];
    if([data isEqualToString:@"No on air lives"]){
        NSLog(@"No Live Feed");
       
        
    } else if(data != nil){
        NSLog(@"Live Feed On Air");
        [mediaTabBarItem setBadgeValue:@"LIVE"];
    }
    
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
    [connectNav release];
    [mediaTabBarItem release];
    [moreNav release];
    [super dealloc];
}



@end
