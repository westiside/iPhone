//
//  WestsideViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "MoreViewController.h"
#import "WestsideAppDelegate.h"
#include <stdlib.h>

@implementation MoreViewController
@synthesize imageBanner;
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
    [imageBanner release];
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
       
                      
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:PICTURES];
    
    for(int i = 1; i <= PICTURES ; i++){
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[@"pic" stringByAppendingFormat:@"%d",i] ofType:@"png"]];
       
        [array addObject:image];
      
    }  
    
    imageBanner.animationImages = array;
    [array release];
    imageBanner.animationDuration = 20;
    imageBanner.layer.borderColor =[UIColor whiteColor].CGColor;
    imageBanner.layer.borderWidth = 1;
    [imageBanner startAnimating];
       
    
     
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.moreNav setNavigationBarHidden:YES animated:NO];
}



- (void)viewDidUnload
{
    [self setTv:nil];
    [self setImageBanner:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)directions:(id)sender{
    
    NSString* searchQuery = @"10000 W Newberry Rd Gainesville FL 32606";
    
    searchQuery =  [searchQuery stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    NSString* urlString = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", searchQuery];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
    
}

- (IBAction)egiving:(id)sender{
    if(webVC != nil) {
        [webVC release];
    }
    
    GenericWebNavViewController *aWebNavView = [[GenericWebNavViewController alloc] initWithLinkWithScale:@"http://e-giving.org/start.asp?id=1678" :NO];
    webVC =aWebNavView;
    
    aWebNavView.title = @"eGiving";
    aWebNavView.hidesBottomBarWhenPushed = YES;
    
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.moreNav pushViewController:webVC animated:YES]; 
    [delegate.moreNav setNavigationBarHidden:NO animated:YES];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
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
                label = @"eGiving";
                break;
            }
            case 1: 
            {
                label = @"Get Directions";
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
    
    if(indexPath.section == 0){
        switch (indexPath.row) {
            case 0:
            {
                [self egiving:nil];
                break;
            }
            case 1: 
            {
                [self directions:nil];
                break;
            }
           
           
            default:
                break;
                
                
        }
        
    } 
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}





@end
