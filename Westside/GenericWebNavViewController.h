//
//  GenericWebNavViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/5/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface GenericWebNavViewController : UIViewController <UIWebViewDelegate> {
    BOOL scale;
    UIWebView *webView;
    UIActivityIndicatorView *activity;
    UIBarButtonItem *back_btn;
    UIBarButtonItem *for_btn;
    UIBarButtonItem *ref_btn;
    UIBarButtonItem *stop_btn;
    int page_loads;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString* link;



-(id)initWithLinkWithScale:(NSString *)string:(BOOL)scale_in;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)webViewDidStartLoad:(UIWebView *)webView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;


@property (nonatomic, retain) IBOutlet UIBarButtonItem *back_btn;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *for_btn;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *ref_btn;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *stop_btn;

@end
