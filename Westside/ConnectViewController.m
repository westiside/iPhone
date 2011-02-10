//
//  ConnectViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "ConnectViewController.h"
#import "WestsideAppDelegate.h"


@implementation ConnectViewController
@synthesize twitterView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
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
    
    //Hides Navigation Bar
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.connectNav setNavigationBarHidden:YES]; 
    
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Loading Table View");
    switch(section){
        case 0: return 1;
        case 1: return 2;
        case 2: return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(indexPath.section == 0){
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        }
        
        cell.textLabel.text = @"Week of Jan 30";
        cell.detailTextLabel.text = @"In 1955, “Gunsmoke” began its twenty year run on prime time television. John Wayne was asked to star...";
        

    }else {
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }

        
        if(indexPath.row ==0 && indexPath.section == 1) cell.textLabel.text = @"@wbcgainesville";
        else if(indexPath.row ==1 && indexPath.section == 1) cell.textLabel.text = @"@westsidecollege";
        
    
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section){
        case 0: return @"Pastor's Perspective";
        case 1: return @"Westside on Twitter";
        case 2: return @"Church Staff";
    }
           
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 1){
        if(twitterView != nil) {
            [twitterView release];
        }
           
        TwitterViewController *aTwitterView = [[TwitterViewController alloc] initWithNibName:@"TwitterViewController"bundle:nil];
        twitterView = aTwitterView;
            
        
        
        if(indexPath.row ==0 && indexPath.section == 1) twitterView.title = @"@wbcgainesville";
        else if(indexPath.row ==1 && indexPath.section == 1) twitterView.title = @"@westsidecollege";
        
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.connectNav pushViewController:twitterView animated:YES]; 
        
    }
    else if(indexPath.section == 2){
       
        
    }
    
}

@end
