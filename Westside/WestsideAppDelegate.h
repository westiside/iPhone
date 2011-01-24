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
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
