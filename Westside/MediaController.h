//
//  MediaController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FeedParser.h"

@interface MediaController : UIViewController <UIWebViewDelegate> {
@private
    FeedParser *feeds;
    UISegmentedControl *mediaViewSelector;
    UIWebView *webView;
    UITableView *podcastTable;
    UITableViewCell *PodcastCell;
    BOOL audioSelected;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UITableView *podcastTable;
@property (nonatomic, retain) IBOutlet UITableViewCell *PodcastCell;
@property (nonatomic, retain) IBOutlet UISegmentedControl *mediaViewSelector;
@property (nonatomic, retain) IBOutlet UITableViewCell *tvCell;
- (IBAction)viewChangeRequest:(id)sender;
- (IBAction)liveViewButtonSelected:(id)sender;
- (IBAction)refreshButtonSelect:(id)sender;
- (void)loadPodcast:(NSString *)string;
- (void)refreshPodCasts:(int)viewRequest:(BOOL)parse;


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)webViewDidStartLoad:(UIWebView *)webView;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end
