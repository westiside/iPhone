//
//  TwitterViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "TwitterViewController.h"
#import "WestsideAppDelegate.h"

@implementation TwitterViewController
@synthesize loadingCell;
@synthesize tweetTable;
@synthesize tvCell;
@synthesize twitter;


- (void)dealloc
{
    [tweetTable release];
    [tvCell release];
    [twitter dealloc];
    [loadingCell release];
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
    
    [self performSelectorInBackground:@selector(loadTweets) withObject:nil];

    
    
}

- (void)viewDidUnload
{
    [self setTvCell:nil];
    [self setTweetTable:nil];
    [self setLoadingCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)loadTweets{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    if(!twitter){
        twitter = [[TwitterParser alloc] initWithScreenName:self.title];
        [twitter parseXML];
    }
    loaded = YES;
    
    [self performSelectorOnMainThread:@selector(updateTweetTable) withObject:nil waitUntilDone:YES];
    
    [pool release];
}

-(void)updateTweetTable{
    
    [tweetTable beginUpdates];
    [tweetTable deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    [tweetTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [tweetTable endUpdates];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return loaded ? [twitter.tweets count] : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"TweetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if(loaded){
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"TwitterTableViewCellNib" owner:self options:nil];
            cell = tvCell;
            tvCell = nil;
        }
        
        Tweet *tweet = [twitter.tweets objectAtIndex:indexPath.row];
            
        UILabel *label;
        UITextView *tv;
        
        cell.imageView.image = twitter.pic;
        
        tv = (UITextView *)[cell viewWithTag:1];

        tv.text = tweet.text;
        label = (UILabel *)[cell viewWithTag:2];
        label.text = tweet.created_at;
        
        [cell setBackgroundColor:[UIColor colorWithRed:.96 green:.94 blue:.90 alpha:1]];
    }else{
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"TwitterLoadedCell" owner:self options:nil];
            cell = loadingCell;
            loadingCell = nil;
        }
        
    }
        
    return cell;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(loaded){
        Tweet *tweet = [twitter.tweets objectAtIndex:indexPath.row];
        return tweet.height > 75 ? tweet.height : 75;
    }
    else return  44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
