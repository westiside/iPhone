//
//  MoreTabViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "MoreTabViewController.h"
#import "WestsideAppDelegate.h"

@implementation MoreTabViewController
@synthesize map;
@synthesize webVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMap:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)eGiveBtnPress:(id)sender {
    if(webVC != nil) {
        [webVC release];
    }
    
    GenericWebNavViewController *aWebNavView = [[GenericWebNavViewController alloc] init];
    webVC =aWebNavView;
    
    aWebNavView.title = @"eGiving";
    
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.moreNav pushViewController:webVC animated:YES]; 
     
   /* NSURL *url = [NSURL URLWithString:@"http://e-giving.org/start.asp?id=1678"];
    if (![[UIApplication sharedApplication] openURL:url])
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
    */
    

}

@end
