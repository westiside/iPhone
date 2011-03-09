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
@synthesize back_btn;
@synthesize for_btn;
@synthesize ref_btn;
@synthesize stop_btn;
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
    [back_btn release];
    [for_btn release];
    [ref_btn release];
    [stop_btn release];
    [link release];
    
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
    page_loads = 0;
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You must have an active network connection in order to view this page." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [alert release];
        
    } else {
        
        [webView setScalesPageToFit:scale];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:link]]];
    }
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setActivity:nil];
    [self setBack_btn:nil];
    [self setFor_btn:nil];
    [self setRef_btn:nil];
    [self setStop_btn:nil];
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
    [stop_btn setEnabled:NO];
    [ref_btn setEnabled:YES];
    [back_btn setEnabled:[self.webView canGoBack]];
    [for_btn setEnabled:[self.webView canGoForward]];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [activity startAnimating];
    [stop_btn setEnabled:YES];
    [ref_btn setEnabled:NO];
}


@end
