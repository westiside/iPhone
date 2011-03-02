//
//  HomeViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/17/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "HomeViewController.h"


@implementation HomeViewController
@synthesize picBanner;

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
    [picBanner release];
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
    picBanner.animationImages = [[NSArray alloc] initWithObjects:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ban1" ofType:@"png"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ban2" ofType:@"png"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ban3" ofType:@"png"]],[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ban4" ofType:@"png"]] ,nil];
    picBanner.animationDuration = 15;
    [picBanner startAnimating];

}

- (void)viewDidUnload
{
    [self setPicBanner:nil];
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
