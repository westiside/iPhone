//
//  WestsideViewController.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/21/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WestsideViewController : UIViewController {
@private
    
    UIImageView *imageBanner;
    UIWebView *contentView;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageBanner;
@property (nonatomic, retain) IBOutlet UIWebView *contentView;

@end
