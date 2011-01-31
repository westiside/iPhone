//
//  MediaController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedParser.h"

@interface MediaController : UIViewController {
@private
    FeedParser *feeds;
    UISegmentedControl *mediaViewSelector;
    UIWebView *webView;
    UITableView *podcastTable;
    BOOL audioSelected;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UITableView *podcastTable;
@property (nonatomic, retain) IBOutlet UISegmentedControl *mediaViewSelector;
- (IBAction)viewChangeRequest:(id)sender;
- (IBAction)liveViewButtonSelected:(id)sender;
- (IBAction)refreshButtonSelect:(id)sender;
- (void)loadPodcast:(NSString *)string;
- (void)refreshPodCasts:(int)viewRequest:(BOOL)parse;
@end
