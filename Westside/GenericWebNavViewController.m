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
@synthesize html;


-(id)initWithLinkWithScale:(NSString *)string:(BOOL)scale_in{
    
    self = [super init];
    if (self) {
        link = [string copy];
        scale = scale_in;
        wp = NO;
    }
    return self;
}

-(id)initWithHTMLAndLink:(NSString *)string:(NSString *)link_in{
    self = [super init];
    if (self) {
        html = [string copy];
        link = [link_in copy];
        wp = YES;
    }
    return self;
}


- (void)dealloc
{
    [super dealloc];
    [link release];
    if(html) [html release];
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
    
    if (wp){
        [webView setScalesPageToFit:NO];
        [webView loadHTMLString:html baseURL:nil];
    }
    else {
        [webView setScalesPageToFit:scale];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:link]]];
    }
    
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error loading page" message:@"There was a problem accessing the webpage, please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    
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
