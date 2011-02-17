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
    BOOL wp;
    UIWebView *webView;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString* link;
@property (nonatomic, retain) NSString* html;



-(id)initWithLinkWithScale:(NSString *)string:(BOOL)scale_in;
-(id)initWithHTMLAndLink:(NSString *)string:(NSString *)link_in;

@end
