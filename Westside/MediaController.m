//
//  MediaController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "MediaController.h"
#import "WestsideAppDelegate.h"
#import "Reachability.h"

@implementation MediaController
@synthesize podcastTable;
@synthesize PodcastCell;
@synthesize mediaViewSelector;
@synthesize tvCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)dealloc
{
    [mediaViewSelector release];
    [podcastTable release];
    [feeds release];
    [PodcastCell release];
    [tvCell release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    audioSelected = YES;
    loaded = NO;
    NSInvocationOperation* theOp = [[[NSInvocationOperation alloc] initWithTarget:self
                                                                         selector:@selector(refreshPodCasts) object:nil] autorelease];
    
    [NSThread detachNewThreadSelector:@selector(start)
                             toTarget:theOp withObject:nil];
    
    

       
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
   
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
                
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You must have an active network connection in order to stream Podcasts" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [alert release];
        
        
    }
    /*
    NSInvocationOperation* liveOp = [[[NSInvocationOperation alloc] initWithTarget:self
                                                                          selector:@selector(checkForLiveFeed) object:nil] autorelease];
    
    [NSThread detachNewThreadSelector:@selector(start)
                             toTarget:liveOp withObject:nil];
    */
}

/*
- (void) checkForLiveFeed {
    
    Check with:
     NSInvocationOperation* liveOp = [[[NSInvocationOperation alloc] initWithTarget:self
     selector:@selector(checkForLiveFeed) object:nil] autorelease];
     
     [NSThread detachNewThreadSelector:@selector(start)
     toTarget:liveOp withObject:nil];
    
     
    NSURL *liveFeed = [NSURL URLWithString:@"http://wbcmedia.sermon.net/l/main"];
    NSString *data = [NSString stringWithContentsOfURL:liveFeed encoding:NSStringEncodingConversionAllowLossy error:nil];
    if(data == nil){
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.mediaTabBarItem setBadgeValue:@"LIVE"];
        
        
    } else{
        
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.mediaTabBarItem setBadgeValue:nil];
        
    }
    
}
*/

- (void)viewDidUnload
{
    [self setPodcastCell:nil];
    [self setMediaViewSelector:nil];
    [self setTvCell:nil];
    [super viewDidUnload];
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - User Interaction
- (IBAction)typeChanged:(id)sender {
    if ([mediaViewSelector selectedSegmentIndex] == 0) {
        audioSelected = YES;
    }else   audioSelected = NO;
    [self   refreshPodCasts];
}

- (IBAction)liveViewButtonSelected:(id)sender {

        //Check for Live Feed
        NSURL *liveFeed = [NSURL URLWithString:LIVEFEED];
        NSString *data = [NSString stringWithContentsOfURL:liveFeed encoding:NSStringEncodingConversionAllowLossy error:nil];
        if([data isEqualToString:@"No on air lives"]){
            NSLog(@"No Live Feed");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Live Feed Off-Air" message:@"Check back on Sunday at 9:15am, 10:45am, and 6:00pm" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            [alert release];
            
        } else{
            NSLog(@"Live Feed On Air");
            [self loadPodcast:@"http://wbcmedia.sermon.net/l/main"];
        }
        
    
}


#pragma mark - Accessory Methods

- (void)loadPodcast:(NSString *)string{
    
	[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    MPMoviePlayerViewController* theMoviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL: [NSURL URLWithString:string]];
    [self presentMoviePlayerViewControllerAnimated:theMoviePlayer];
    
    
}



- (IBAction)refreshSelected:(id)sender{
    loaded = NO;
    [podcastTable reloadData];
    
    [feeds parseXML];
    [self refreshPodCasts];
}

- (void)refreshPodCasts{
    if(!feeds){
        feeds = [[FeedParser alloc] init];
        [feeds parseXML];
    }
    
    
    
    [podcastTable beginUpdates];
    [podcastTable deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    if(!loaded){
        [podcastTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
        loaded = YES;
    }
    else if(audioSelected)[podcastTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
    else [podcastTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];
    [podcastTable endUpdates];
        
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(!loaded) return 1;
    else if(audioSelected) return [feeds.audioFeeds count];
    else return [feeds.videoFeeds count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if(loaded){
      
    
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier] autorelease];
        }
    
    
    
        Feed *f;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if(audioSelected){
            f = [feeds.audioFeeds objectAtIndex:indexPath.row];
            
        }else{
            f = [feeds.videoFeeds objectAtIndex:indexPath.row];
        }
    
        UIFont *font = [UIFont fontWithName:@"Helvetica Bold" size:15];
        [cell.textLabel setFont:font];
        cell.textLabel.text = f.feedName;
        cell.detailTextLabel.text = f.pubDate;
        [cell.detailTextLabel setTextColor:[UIColor darkGrayColor]];
        
    }else{
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"LoadingTableCellView" owner:self options:nil];
            cell = tvCell;
            tvCell = nil;
        }

    }

    
    return cell;
     
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(loaded){
        if(audioSelected){
            Feed *f = [feeds.audioFeeds objectAtIndex:indexPath.row];
            [self loadPodcast:f.feedLink];
        } else
        {
            Feed *f = [feeds.videoFeeds objectAtIndex:indexPath.row];
            [self loadPodcast:f.feedLink];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
       
    
    
}



@end



