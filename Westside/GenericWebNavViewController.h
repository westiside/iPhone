//
//  GenericWebNavViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GenericWebNavViewController : UIViewController {
    
    UIWebView *webView;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
