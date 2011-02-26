//
//  MediaController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "FeedParser.h"

@interface MediaController : UIViewController {
@private
    FeedParser *feeds;
    UISegmentedControl *mediaViewSelector;
    UITableView *podcastTable;
    UITableViewCell *PodcastCell;
    BOOL audioSelected;
    BOOL loaded;
}
@property (nonatomic, retain) IBOutlet UITableView *podcastTable;
@property (nonatomic, retain) IBOutlet UITableViewCell *PodcastCell;
@property (nonatomic, retain) IBOutlet UISegmentedControl *mediaViewSelector;
@property (nonatomic, retain) IBOutlet UITableViewCell *tvCell;
- (IBAction)liveViewButtonSelected:(id)sender;
- (IBAction)refreshSelected:(id)sender;
- (void)loadPodcast:(NSString *)string;
- (void) checkForLiveFeed; 
- (void)refreshPodCasts;



@end
