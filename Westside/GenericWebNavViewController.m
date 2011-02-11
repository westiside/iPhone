//
//  GenericWebNavViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GenericWebNavViewController.h"
#import "WestsideAppDelegate.h"

@implementation GenericWebNavViewController
@synthesize webView;
@synthesize link;


-(id)initWithLinkWithScaleAndNavHidden:(NSString *)string:(BOOL)scale_in:(BOOL)hide_in{
    
    self = [super init];
    if (self) {
        self.link = string;
        scale = scale_in;
        hide = hide_in;
        
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

    [webView setScalesPageToFit:scale];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:link]]];
    
    //Unhide Navigation Bar
    if (!hide){
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.moreNav setNavigationBarHidden:NO animated:YES]; 
    }
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //Unhides Navigation Bar
    if (!hide){
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.moreNav setNavigationBarHidden:YES animated:YES]; 
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
