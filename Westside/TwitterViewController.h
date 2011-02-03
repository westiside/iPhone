//
//  TwitterViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterParser.h"

@interface TwitterViewController : UIViewController {
@private
    TwitterParser *twitter;
    UITableView *tweetTable;
}

@property (nonatomic, retain) IBOutlet UITableView *tweetTable;


@end
