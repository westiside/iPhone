//
//  WestsideAppDelegate.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WestsideAppDelegate : NSObject <UIApplicationDelegate> {
@private

    UITabBarController *tabBarController;
    UINavigationController *connectNav;
    UITabBarItem *mediaTabBarItem;
    UINavigationController *moreNav;
    UINavigationController *minNav;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController *connectNav;

@property (nonatomic, retain) IBOutlet UITabBarItem *mediaTabBarItem;
@property (nonatomic, retain) IBOutlet UINavigationController *moreNav;
@property (nonatomic, retain) IBOutlet UINavigationController *minNav;

@end
