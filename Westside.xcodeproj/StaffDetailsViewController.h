//
//  StaffDetailsViewController.h
//  Westside
//
//  Created by Nick Eubanks on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface StaffDetailsViewController : UIViewController {
    
    UITableView *tv;
    UIImageView *image;
    UILabel *nameLabel;
    UILabel *titleLabel;
}
@property (nonatomic, retain) IBOutlet UITableView *tv;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;

@end
