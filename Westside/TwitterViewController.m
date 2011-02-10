//
//  TwitterViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwitterViewController.h"
#import "WestsideAppDelegate.h"

@implementation TwitterViewController
@synthesize tweetTable;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)dealloc
{
    [tweetTable release];
    [twitter release];
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
    
    //Unhides Navigation Bar
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.connectNav setNavigationBarHidden:NO animated:YES]; 
    
    twitter = [[TwitterParser alloc] initWithScreenName:self.title];
    [twitter parseXML];
    [tweetTable reloadData];
    
    
}

- (void)viewDidUnload
{
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
    //Unhides Navigation Bar
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.connectNav setNavigationBarHidden:YES animated:YES]; 
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
    UIImageView *image;
    UITextView *tv;
    
    image = (UIImageView *)[cell viewWithTag:0];
    image.image = twitter.pic;
    
    tv = (UITextView *)[cell viewWithTag:1];
    NSArray *array = [tweet.text componentsSeparatedByString:@"\n"];
    
    NSString *text = [array objectAtIndex:0];
    
    /* This is where we define the ideal font that the Label wants to use.
     Use the font you want to use and the largest font size you want to use. */
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:18];
    
    int i;
    /* Time to calculate the needed font size.
     This for loop starts at the largest font size, and decreases by two point sizes (i=i-2)
     Until it either hits a size that will fit or hits the minimum size we want to allow (i > 10) */
    for(i = 18; i > 8; i=i-2)
    {
        // Set the new font size.
        font = [font fontWithSize:i];
        NSLog(@"Trying size: %u", i);
        
        /* This step is important: We make a constraint box 
         using only the fixed WIDTH of the UILabel. The height will
         be checked later. */ 
        CGSize constraintSize = CGSizeMake(228.0f, MAXFLOAT);
        
        // This step checks how tall the label would be with the desired font.
        CGSize labelSize = [text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        /* Here is where you use the height requirement!
         Set the value in the if statement to the height of your UILabel
         If the label fits into your required height, it will break the loop
         and use that font size. */
        if(labelSize.height <= 61.0f)
            break;
    }
    NSLog(@"Best size is: %u", i);
    
    // Set the UILabel's font to the newly adjusted font.
    tv.font = font;
    
    tv.text = text;
    
    label = (UILabel *)[cell viewWithTag:2];
    label.text = tweet.created_at;
    
    //cell.textLabel.text = tweet.text;
    //cell.detailTextLabel.text = tweet.created_at;
    //cell.imageView.image = twitter.pic;
    
    
    return cell;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
