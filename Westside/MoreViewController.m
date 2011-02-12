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
    imageBanner.animationImages = [[NSArray alloc] initWithObjects:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic1" ofType:@"jpg"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic2" ofType:@"jpg"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic3" ofType:@"jpg"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic4" ofType:@"jpg"]] ,nil];
    imageBanner.animationDuration = 20;
    imageBanner.layer.cornerRadius = 10.0;
    imageBanner.clipsToBounds = YES;
    imageBanner.layer.borderColor = [UIColor whiteColor].CGColor;
    imageBanner.layer.borderWidth = 1.5;
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




@end
