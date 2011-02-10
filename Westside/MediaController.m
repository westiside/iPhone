//
//  MediaController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "MediaController.h"
#import "WestsideAppDelegate.h"

@implementation MediaController
@synthesize webView;
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
    [webView release];
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
    NSURL *liveFeed = [NSURL URLWithString:@"http://wbcmedia.sermon.net/l/main"];
    NSString *data = [NSString stringWithContentsOfURL:liveFeed encoding:NSStringEncodingConversionAllowLossy error:nil];
    if(data == nil){
        /*NSLog(@"No Internet Connection");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"An internet connection is required to listen podcasts. " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [alert release];*/
        
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.mediaTabBarItem setBadgeValue:@"LIVE"];
        
        
    } else{
        
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.mediaTabBarItem setBadgeValue:nil];
        
    }
        feeds = [[FeedParser alloc] init];
        [self refreshButtonSelect:nil];
        [feeds parseXML];    
        [podcastTable reloadData];
        
       
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - User Interaction

- (IBAction)viewChangeRequest:(id)sender {
    [self refreshPodCasts:[mediaViewSelector selectedSegmentIndex]:NO];
    
}

- (IBAction)liveViewButtonSelected:(id)sender {

        //Check for Live Feed
        NSURL *liveFeed = [NSURL URLWithString:@"http://wbcmedia.sermon.net/l/main"];
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

- (IBAction)refreshButtonSelect:(id)sender {
    if(audioSelected) [self refreshPodCasts:0 :YES];
    else [self refreshPodCasts:1 :YES];
}



#pragma mark - Accessory Methods

- (void)loadPodcast:(NSString *)string{
    NSLog(@"Loading Podcast");
    
	[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:string]]];
    
    
}


- (void)refreshPodCasts:(int)viewRequest:(BOOL)parse{
    if(!feeds){
        feeds = [[FeedParser alloc] init];
        [self refreshButtonSelect:nil];
    }
    if(parse) {
        NSLog(@"Parsing Feeds");
        [feeds parseXML];
    }
    
    switch(viewRequest){
        case 0 :    //Audio
        {
            NSLog(@"Audio View Requested");
            audioSelected = YES;     
            break;
        }
        case 1  :   //Video
        {
            NSLog(@"Video View Requested");
            audioSelected = NO;
            break;
        }
            
    }
    
    
    /*
     Reload the TableView Data with Animation
     ANIMATION OPTIONS:
     UITableViewRowAnimationFade,
     UITableViewRowAnimationRight,
     UITableViewRowAnimationLeft,
     UITableViewRowAnimationTop,
     UITableViewRowAnimationBottom,
     UITableViewRowAnimationNone,
     UITableViewRowAnimationMiddle
     */
    
    [podcastTable beginUpdates];
    [podcastTable deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    if(parse) [podcastTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    else if(audioSelected)[podcastTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
    else [podcastTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];
    [podcastTable endUpdates];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSLog(@"Sections retrieved........");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"Loading Table View");
    if(audioSelected) return [feeds.audioFeeds count];
    else return [feeds.videoFeeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
     
     
    /*
    
    static NSString *MyIdentifier = @"MediaCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"MediaTableViewCellNib" owner:self options:nil];
        cell = tvCell;
        tvCell = nil;
    }
    
    Feed *f;
    
    if(audioSelected){
        f = [feeds.audioFeeds objectAtIndex:indexPath.row];
    }else{
        f = [feeds.videoFeeds objectAtIndex:indexPath.row];
    }

    
    UIImageView *image;
    UILabel *label;
    
    image = (UIImageView *)[cell viewWithTag:0];
    image.image = f.image;
    
    
    label = (UILabel *)[cell viewWithTag:1];
    label.text = f.feedName;
    
    label = (UILabel *)[cell viewWithTag:2];
    label.text = f.feedName;
    */  
    
    
    // Configure the cell...
    Feed *f;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(audioSelected){
        f = [feeds.audioFeeds objectAtIndex:indexPath.row];
       
    }else{
        f = [feeds.videoFeeds objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = f.pubDate;
    cell.detailTextLabel.text = f.feedName;
    
   

      
    return cell;
     
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Table View Member Selected");
    if(audioSelected){
        Feed *f = [feeds.audioFeeds objectAtIndex:indexPath.row];
        [self loadPodcast:f.feedLink];
    } else
    {
        Feed *f = [feeds.videoFeeds objectAtIndex:indexPath.row];
        [self loadPodcast:f.feedLink];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"Deselected");
    
    
    
}

/*
 [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
 */


#pragma mark - Web View Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"Webview Request to Load");
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"WEBVIEW Finished Loading");
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"WEBVIEW Started Loading");
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    NSLog(@"WEBVIEW Fail With Error");
    [webView stopLoading];
    
}

@end



