//
//  MediaViewController.m
//  Westside
//
//  Created by Nick Eubanks on 1/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MediaViewController.h"


@implementation MediaViewController
@synthesize MediaSegmentedControl;
@synthesize MediaView;

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
    [MediaView release];
    [MediaSegmentedControl release];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)ViewChangeRequest:(id)sender {
    NSLog(@"Media View Change Requested");
    
    int viewRequest = [MediaSegmentedControl selectedSegmentIndex];
    
    switch(viewRequest){
        case 0 :    //Audio
        {
            NSLog(@"Switching to Audio View");
            break;
        }
        case 1  :   //Video
        {
            NSLog(@"Switching to Video View");
            break;
        }
        case 2  :   //Live
        {
            NSLog(@"Switching to Live Feed");
            break;
        }
            
    }
}
@end
