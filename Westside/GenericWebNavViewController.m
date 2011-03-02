//
//  GenericWebNavViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/5/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "GenericWebNavViewController.h"
#import "WestsideAppDelegate.h"

@implementation GenericWebNavViewController
@synthesize activity;
@synthesize webView;
@synthesize link;


-(id)initWithLinkWithScale:(NSString *)string:(BOOL)scale_in{
    
    self = [super init];
    if (self) {
        link = [string copy];
        scale = scale_in;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [link release];
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
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You must have an active network connection in order to view this page." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [alert release];
        
    } else
    
        [webView setScalesPageToFit:scale];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:link]]];
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setActivity:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Webview Delegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [activity stopAnimating];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [activity startAnimating];
    
}


@end
