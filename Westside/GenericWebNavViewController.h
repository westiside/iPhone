//
//  GenericWebNavViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface GenericWebNavViewController : UIViewController <UIWebViewDelegate> {
    BOOL scale;
    BOOL wp;
    UIWebView *webView;
    UIActivityIndicatorView *activity;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString* link;
@property (nonatomic, retain) NSString* html;



-(id)initWithLinkWithScale:(NSString *)string:(BOOL)scale_in;
-(id)initWithHTMLAndLink:(NSString *)string:(NSString *)link_in;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)webViewDidStartLoad:(UIWebView *)webView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;

@end
