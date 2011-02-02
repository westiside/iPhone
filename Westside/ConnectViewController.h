//
//  ConnectViewController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterViewController.h"

@interface ConnectViewController : UIViewController {
@private
    TwitterViewController *twitterView;
}

@property (nonatomic, retain) TwitterViewController *twitterView;

@end
