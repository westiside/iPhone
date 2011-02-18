//
//  StaffDetailsViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StaffDetailsViewController.h"


@implementation StaffDetailsViewController
@synthesize tv;
@synthesize image;
@synthesize nameLabel;
@synthesize titleLabel;

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
    tv.backgroundColor = [UIColor clearColor];
    image.layer.cornerRadius = 12.0;
    image.clipsToBounds = YES;
    image.layer.borderColor = [UIColor whiteColor].CGColor;
    image.layer.borderWidth = 1.5;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTv:nil];
    [self setImage:nil];
    [self setNameLabel:nil];
    [self setTitleLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if (indexPath.row == 0) cell.textLabel.text = @"Launch Email";
    else if(indexPath.row == 1) cell.textLabel.text = @"Twitter Timeline";
    else cell.textLabel.text = @"Facebook Page";
    
    
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    
    [cell setBackgroundColor:[UIColor colorWithRed:.96 green:.94 blue:.90 alpha:1]];
    
    return cell;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto:" stringByAppendingString:@"dmcalhany@westsidebaptist.org"]]];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
       
    
}




@end
