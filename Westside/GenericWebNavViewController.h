//
//  GenericWebNavViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GenericWebNavViewController : UIViewController {
    BOOL scale;
    BOOL hide;
    UIWebView *webView;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString* link;


-(id)initWithLinkWithScaleAndNavHidden:(NSString *)string:(BOOL)scale_in:(BOOL)hide_in;
@end
