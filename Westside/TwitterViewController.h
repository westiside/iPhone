//
//  TwitterViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterParser.h"

@interface TwitterViewController : UIViewController {
@private
    TwitterParser *twitter;
    UITableView *tweetTable;
    UITableViewCell *tvCell;
    BOOL loaded;
    UITableViewCell *loadingCell;
}

@property (nonatomic, retain) IBOutlet UITableView *tweetTable;
@property (nonatomic, retain) IBOutlet UITableViewCell *tvCell;
@property (nonatomic, retain) TwitterParser *twitter;
-(void)loadTweets;
-(void)updateTweetTable;
@property (nonatomic, retain)IBOutlet UITableViewCell *loadingCell;

@end
