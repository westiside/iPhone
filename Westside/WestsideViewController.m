//
//  WestsideViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "WestsideViewController.h"

@implementation WestsideViewController
@synthesize imageBanner;

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
    imageBanner.layer.borderWidth = 3.0;
    [imageBanner startAnimating];
       
     
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

@end
