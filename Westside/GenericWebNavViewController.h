//
//  GenericWebNavViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GenericWebNavViewController : UIViewController {
    BOOL isConnect;
    UIWebView *webView;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString* link;


-(id)initWithLinkAndIsConnect:(NSString*)string:(BOOL)connect;
@end
