//
//  MoreTabViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "MinistriesTabViewController.h"
#import "WestsideAppDelegate.h"


@implementation MinistriesTabViewController
@synthesize tv;
@synthesize webVC;

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
    if(webVC) [webVC release];
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
    tv.backgroundColor = [UIColor clearColor];
}

- (void)viewDidUnload
{
    [self setTv:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.minNav setNavigationBarHidden:YES animated:NO];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    else return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier] autorelease];
    }

    NSString *label = @"";
    if(indexPath.section == 0){
        switch (indexPath.row) {
            case 0:
            {
                label = @"Website";
                break;
            }
            case 1: 
            {
                label = @"Calendar";
                break;
            }
        }

    }
    else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0: 
            {
                label = @"Children";
                break;
            }
            case 1: 
            {
                label = @"Youth";
                break;
            }
            case 2:
            {
                label = @"College";
                break;
            }
            case 3:
            {
                label = @"Adult Ministries";
                break;
            }
            case 4:
            {
                label = @"Missions";
                break;
            }
            case 5:
            {
                label = @"Music";
                break;
            }
            case 6:
            {
                label = @"Media Ministry";
                break;
            }
            default:
            break;
        }
    } 
    
    cell.textLabel.text = label;    
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    [cell setBackgroundColor:[UIColor colorWithRed:1 green:.98 blue:.94 alpha:1]];
    //250	240	230
    
    return cell;
}



#pragma mark - Table view delegate




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSString *label = @"";
    NSString *link = @"";
    if(indexPath.section == 0){
        switch (indexPath.row) {
            case 0:
            {
                label = @"Website";
                link = WEBSITE;
                break;
            }
            case 1: 
            {
                label = @"Calendar";
                link =  CALENDAR;
                break;
            }
        }
    }
    else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0: 
            {
                label = @"Children";
                link =  CHILDREN;
                break;
            }
            case 1: 
            {
                label = @"Youth";
                link =  YOUTH;
                break;
            }
            case 2:
            {
                label = @"College";
                link =  COLLEGE;
                break;
            }
            case 3:
            {
                label = @"Adult Ministries";
                link =  ADULT;
                break;
            }
            case 4:
            {
                label = @"Missions";
                link =  MISSIONS;
                break;
            }
            case 5:
            {
                label = @"Music";
                link =  MUSIC;
                break;
            }
            case 6:
            {
                label = @"Media Ministry";
                link =  MEDIA;
                break;
            }
            default:
                break;
                
                
        }
    } 
    
    
    
    [self webWithLinkAndTitle:link :label];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void) webWithLinkAndTitle:(NSString *)link:(NSString *)title{
    if(webVC != nil) {
        [webVC release];
    }
    
    GenericWebNavViewController *aWebNavView = [[GenericWebNavViewController alloc] initWithLinkWithScale:link :YES];
    webVC =aWebNavView;
    
    aWebNavView.title = title;
    aWebNavView.hidesBottomBarWhenPushed = YES;
    
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.minNav pushViewController:webVC animated:YES]; 
    [delegate.minNav setNavigationBarHidden:NO animated:YES];
}



@end
