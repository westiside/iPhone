//
//  BlogPostViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/26/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

#define WORDPRESSFEED @"http://www.westsidebaptist.org/who-we-are/pastors-perspectives/"

@interface BlogPostViewController : UIViewController {
    UIWebView *webView;
    UIActivityIndicatorView *activity;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;
-(void) loadBlog;

@end
