//
//  MoreTabViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "MoreTabViewController.h"
#import "WestsideAppDelegate.h"


@implementation MoreTabViewController
@synthesize map;
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
    
    map.layer.cornerRadius = 20.0;
    map.clipsToBounds = YES;
    map.layer.borderColor = [UIColor whiteColor].CGColor;
    map.layer.borderWidth = 3.0;
    //29.6604, Longitude = -82.4476
    CLLocationDegrees lat = 29.661;
    CLLocationDegrees longit = -82.4476;
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:lat longitude:longit];
    MKCoordinateRegion region;
    region.center = loc.coordinate;
    
    MKCoordinateSpan span;
    span.latitudeDelta = .0025;
    span.longitudeDelta = .0025;
    region.span = span;

    
    
    [map setRegion:region animated:YES];
    
    
     
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

- (IBAction)eGiveBtnPress:(id)sender {
    if(webVC != nil) {
        [webVC release];
    }
    
    GenericWebNavViewController *aWebNavView = [[GenericWebNavViewController alloc] initWithLink:@"http://e-giving.org/start.asp?id=1678"];
    webVC =aWebNavView;
    
    aWebNavView.title = @"eGiving";
    aWebNavView.hidesBottomBarWhenPushed = YES;
    
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.moreNav pushViewController:webVC animated:YES]; 
     
}

- (IBAction)webBtnPress:(id)sender{
    if(webVC != nil) {
        [webVC release];
    }
    
    GenericWebNavViewController *aWebNavView = [[GenericWebNavViewController alloc] initWithLink:@"http://www.westsidebaptist.org/"];
    webVC =aWebNavView;
    
    aWebNavView.title = @"Website";
    aWebNavView.hidesBottomBarWhenPushed = YES;
    
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.moreNav pushViewController:webVC animated:YES]; 
}

- (IBAction)directionsBtnPress:(id)sender{
    
     /*CLLocationCoordinate2D currentLocation = [self getCurrentLocation];
     NSString* address = @"123 Main St., New York, NY, 10001";
     NSString* url = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%@",
     currentLocation.latitude, currentLocation.longitude,
     [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
      */
     
    
}



@end
