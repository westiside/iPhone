//
//  WestsideAppDelegate.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "WestsideAppDelegate.h"
#import "Reachability.h"

@implementation WestsideAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize connectNav;
@synthesize mediaTabBarItem;
@synthesize moreNav;
@synthesize minNav;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    /*if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable) {
        
    //Check for Live Feed
    NSURL *liveFeed = [NSURL URLWithString:@"http://wbcmedia.sermon.net/l/main"];
    NSString *data = [NSString stringWithContentsOfURL:liveFeed encoding:NSStringEncodingConversionAllowLossy error:nil];
    if([data isEqualToString:@"No on air lives"]){
        NSLog(@"No Live Feed");
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.mediaTabBarItem setBadgeValue:nil];

        
        
    } else if(data == nil){
        NSLog(@"Live Feed On Air");
        [mediaTabBarItem setBadgeValue:@"LIVE"];
    } 
    }*/
    
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


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSInvocationOperation* liveOp = [[[NSInvocationOperation alloc] initWithTarget:self
                                                                          selector:@selector(checkForLiveFeed) object:nil] autorelease];
    
    [NSThread detachNewThreadSelector:@selector(start)
                             toTarget:liveOp withObject:nil];
    
}


- (void) checkForLiveFeed {
    
    /* Check with:
     NSInvocationOperation* liveOp = [[[NSInvocationOperation alloc] initWithTarget:self
     selector:@selector(checkForLiveFeed) object:nil] autorelease];
     
     [NSThread detachNewThreadSelector:@selector(start)
     toTarget:liveOp withObject:nil];
     
     */
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable) {
        NSURL *liveFeed = [NSURL URLWithString:@"http://wbcmedia.sermon.net/l/main"];
        NSString *data = [NSString stringWithContentsOfURL:liveFeed encoding:NSStringEncodingConversionAllowLossy error:nil];
        if(data == nil){
            [mediaTabBarItem setBadgeValue:@"LIVE"];
            
        } else{
            [mediaTabBarItem setBadgeValue:nil];
            
        }
        
        NSLog(@"Check Complete");
    }
}


- (void)dealloc {

    [window release];
    [tabBarController release]; 
    [connectNav release];
    [mediaTabBarItem release];
    [moreNav release];
    [minNav release];
    [super dealloc];
}



@end
