//
//  BlogPostViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/26/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "BlogPostViewController.h"


@implementation BlogPostViewController
@synthesize webView;
@synthesize activity;


- (void)dealloc
{
    [webView release];
    [activity release];
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
    NSInvocationOperation* liveOp = [[[NSInvocationOperation alloc] initWithTarget:self
                                                                          selector:@selector(loadPodcast) object:nil] autorelease];
    
    [NSThread detachNewThreadSelector:@selector(start)
                             toTarget:liveOp withObject:nil];
    
    

}

-(void)loadPodcast{
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You must have an active network connection in order to view this page." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [alert release];
        
    } else {
        [activity startAnimating];
        //Load pastor's perspective's page in html and find the most recent blog posting
        NSURL *htmlURL = [NSURL URLWithString:WORDPRESSFEED];
        NSMutableString *pageContents = [NSMutableString stringWithContentsOfURL:htmlURL encoding:NSUTF8StringEncoding error:nil];
        NSArray *lines = [pageContents componentsSeparatedByString:@"pageContent"];
        lines = [[lines objectAtIndex:1] componentsSeparatedByString:@"<a href=\""];
        lines = [[lines objectAtIndex:1] componentsSeparatedByString:@"\">"];
        htmlURL = [NSURL URLWithString:[lines objectAtIndex:0]];// stringByAppendingString:@"feed/rss/"]]; //only use append if you want the feed to parse for summary
        
        //Load the most recent blog posting and get the entire post
        pageContents = [NSMutableString stringWithContentsOfURL:htmlURL encoding:NSUTF8StringEncoding error:nil];
        lines = [pageContents componentsSeparatedByString:@"<div class=\"pageContent\">"];
        lines = [[lines objectAtIndex:1] componentsSeparatedByString:@"<span class=\"comments-link\">"];
        lines = [[lines objectAtIndex:0] componentsSeparatedByString:@"<div id=\"subhead\">"];
        lines = [[lines objectAtIndex:1] componentsSeparatedByString:@"</div>"];
        
        [webView setScalesPageToFit:NO];
        [webView loadHTMLString:[[[@"<h2 style=\"text-align: left;\"><span style=\"color: rgb(139, 69, 19); \">" stringByAppendingString:[lines objectAtIndex:0]] stringByAppendingString:@"</span></h2><div>"] stringByAppendingString:[lines objectAtIndex:1]] baseURL:nil];
        [activity stopAnimating];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
