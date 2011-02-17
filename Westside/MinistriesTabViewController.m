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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return 8;
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
                label = @"Church Website";
                break;
            }
            case 1: 
            {
                label = @"Children";
                break;
            }
            case 2: 
            {
                label = @"Youth";
                break;
            }
            case 3:
            {
                label = @"College";
                break;
            }
            case 4:
            {
                label = @"Adult Ministries";
                break;
            }
            case 5:
            {
                label = @"Missions";
                break;
            }
            case 6:
            {
                label = @"Music";
                break;
            }
            case 7:
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
    [cell setBackgroundColor:[UIColor colorWithRed:.96 green:.94 blue:.90 alpha:1]];
    //250	240	230
    
    return cell;
}



#pragma mark - Table view delegate




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        NSString *label = @"";
        NSString *link = @"";
        switch (indexPath.row) {
            case 0:
            {
                label = @"Website";
                link = @"http://www.westsidemediaministry.com/";
                break;
            }
            case 1: 
            {
                label = @"Children";
                link =  @"http://www.westsidemediaministry.com/connect/ministries/children/";
                break;
            }
            case 2: 
            {
                label = @"Youth";
                link =  @"http://www.westsidemediaministry.com/connect/ministries/youth/";
                break;
            }
            case 3:
            {
                label = @"College";
                link =  @"http://www.westsidemediaministry.com/connect/ministries/college/";
                break;
            }
            case 4:
            {
                label = @"Adult Ministries";
                link =  @"http://www.westsidemediaministry.com/connect/ministries/adult-ministries/";
                break;
            }
            case 5:
            {
                label = @"Missions";
                link =  @"http://www.westsidemissions.com";//http://www.westsidemediaministry.com/connect/ministries/missions/";
                break;
            }
            case 6:
            {
                label = @"Music";
                link =  @"http://www.westsidemusicministry.com";//http://www.westsidemediaministry.com/connect/ministries/music/";
                break;
            }
            case 7:
            {
                label = @"Media Ministry";
                link =  @"http://www.westsidemediaministry.com/connect/ministries/media/";
                break;
            }
            default:
                break;
                
                
        }
        
        [self webWithLinkAndTitle:link :label];
    } 
        
    
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
