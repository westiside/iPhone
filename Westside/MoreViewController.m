//
//  WestsideViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "MoreViewController.h"
#import "WestsideAppDelegate.h"

@implementation MoreViewController
@synthesize map;
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
    imageBanner.animationImages = [[NSArray alloc] initWithObjects:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic1" ofType:@"jpg"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic2" ofType:@"jpg"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic3" ofType:@"jpg"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic4" ofType:@"jpg"]] ,nil];
    imageBanner.animationDuration = 20;
    //imageBanner.layer.cornerRadius = 12.0;
    //imageBanner.clipsToBounds = YES;
    imageBanner.layer.borderColor =[UIColor whiteColor].CGColor;//darkGray
    imageBanner.layer.borderWidth = 1;
    [imageBanner startAnimating];
       
     map.layer.cornerRadius = 10.0;
     map.clipsToBounds = YES;
     map.layer.borderColor = [UIColor whiteColor].CGColor;
     map.layer.borderWidth = 1.5;
     //29.6604, Longitude = -82.4476
     CLLocationDegrees lat = 29.661;
     CLLocationDegrees longit = -82.4476;
     CLLocation *loc = [[CLLocation alloc] initWithLatitude:lat longitude:longit];
     MKCoordinateRegion region;
     region.center = loc.coordinate;
     
     MKCoordinateSpan span;
     span.latitudeDelta = .004;
     span.longitudeDelta = .004;
     region.span = span;
     [loc release];
     
     
     [map setRegion:region animated:YES];
     
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.moreNav setNavigationBarHidden:YES animated:NO];
}



- (void)viewDidUnload
{
    [self setMap:nil];
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
    [cell setBackgroundColor:[UIColor colorWithRed:.96 green:.94 blue:.90 alpha:1]];
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
