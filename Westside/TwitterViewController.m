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
@synthesize tweetTable;
@synthesize tvCell;
@synthesize twitter;


- (void)dealloc
{
    [tweetTable release];
    [tvCell release];
    [twitter dealloc];
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
    
    twitter = [[TwitterParser alloc] initWithScreenName:self.title];
    [twitter parseXML];
    [tweetTable reloadData];
    
    
}

- (void)viewDidUnload
{
    [self setTvCell:nil];
    [self setTweetTable:nil];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Loading Tweets");
    return [twitter.tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"TweetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
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
    
    return cell;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Tweet *tweet = [twitter.tweets objectAtIndex:indexPath.row];
    
    return  tweet.height > 75 ? tweet.height : 75;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
