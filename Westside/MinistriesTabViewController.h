//
//  MoreTabViewController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericWebNavViewController.h"
#import <QuartzCore/QuartzCore.h>
#define CHILDREN @"http://www.westsidebaptist.org/connect/ministries/children/"
#define ADULT @"http://www.westsidebaptist.org/connect/ministries/adult-ministries/"
#define YOUTH @"http://www.westsidebaptist.org/connect/ministries/youth/"
#define MUSIC @"http://www.westsidebaptist.org/connect/ministries/music/"
#define MEDIA @"http://www.westsidebaptist.org/connect/ministries/media/"
#define MISSIONS @"http://www.westsidebaptist.org/connect/ministries/missions/"
#define COLLEGE @"http://www.westsidebaptist.org/connect/ministries/college/"
#define WEBSITE  @"http://westsidebaptist.org/"

@interface MinistriesTabViewController : UIViewController {
@private
    
    GenericWebNavViewController *webVC;
    UITableView *tv;
}

@property (nonatomic, retain) GenericWebNavViewController *webVC;


- (void)webWithLinkAndTitle:(NSString *)link:(NSString *)title;

@property (nonatomic, retain) IBOutlet UITableView *tv;

@end
