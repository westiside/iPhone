//
//  MediaController.m
//  Westside
//
//  Created by Nick Eubanks on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MediaController.h"


@implementation MediaController
@synthesize webView;
@synthesize podcastTable;
@synthesize mediaViewSelector;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)dealloc
{
    [mediaViewSelector release];
    [webView release];
    [podcastTable release];
    [audioFeeds release];
    [videoFeeds release];
    [feedsParser release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    [audioFeeds release];
    [videoFeeds release];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    audioSelected = YES;
    if(!audioFeeds){
        
        if(!feedsParser){
            feedsParser = [[FeedParser alloc] init];
            [self refreshButtonSelect:nil];
        }
        [feedsParser parseXML];
        audioFeeds = [[NSMutableArray alloc] init];
        audioFeeds = [feedsParser audioFeeds];
        
    }
     
    
    [podcastTable reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:string]]];
}

- (void)refreshPodCasts:(int)viewRequest:(BOOL)parse{
    if(!feedsParser){
        feedsParser = [[FeedParser alloc] init];
        [self refreshButtonSelect:nil];
    }
    if(parse) {
        NSLog(@"Parsing Feeds");
        [feedsParser parseXML];
        audioFeeds = nil;
        videoFeeds = nil;
    }
    
    switch(viewRequest){
        case 0 :    //Audio
        {
            NSLog(@"Audio View Requested");
            
            if(!audioFeeds){
                audioFeeds = [[NSMutableArray alloc] init];
                audioFeeds = [feedsParser audioFeeds];
            }
            
            audioSelected = YES;     
            
            
            break;
        }
        case 1  :   //Video
        {
            NSLog(@"Video View Requested");
            if(!videoFeeds){
                videoFeeds = [[NSMutableArray alloc] init];
                videoFeeds = [feedsParser videoFeeds];
            }
            
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"Loading Table View");
    if(audioSelected) return [audioFeeds count];
    else return [videoFeeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(audioSelected){
        Feed *f = [audioFeeds objectAtIndex:indexPath.row];
        cell.textLabel.text = f.feedName;
    }else{
        Feed *f = [videoFeeds objectAtIndex:indexPath.row];
        cell.textLabel.text = f.feedName;
    }
      
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Table View Member Selected");
    if(audioSelected){
        Feed *f = [audioFeeds objectAtIndex:indexPath.row];
        [self loadPodcast:f.feedLink];
    } else
    {
        Feed *f = [videoFeeds objectAtIndex:indexPath.row];
        [self loadPodcast:f.feedLink];
    }
    
}



@end
