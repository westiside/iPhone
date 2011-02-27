//
//  StaffDetailsViewController.m
//  Westside
//
//  Created by Nick Eubanks on 2/14/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "StaffDetailsViewController.h"
#import "WestsideAppDelegate.h"

@implementation StaffDetailsViewController
@synthesize tv;
@synthesize image;
@synthesize nameLabel;
@synthesize titleLabel;
@synthesize webVC;

- (id)initWithID:(int)ID{
    self = [super init];
    if(self){        
        switch (ID) {
            case 0: //gary
                imgPath = @"garyL";
                name = @"Gary Crawford";
                title = @"Senior Pastor";
                email = @"dmcalhany@westsidebaptist.org";
                break;
            case 2: //daniel
                imgPath = @"danielL" ;
                name = @"Daniel Morris" ;
                title= @"Associate Pastor, Minister of Music" ;
                email = @"dmorris@westsidebaptist.org" ;
                break;
            case 10: //mike
                imgPath = @"mikeL" ;
                name = @"Mike Ricks" ;
                title = @"Associate Minister of Music and Media" ;
                email = @"mricks@westsidebaptist.org" ;
                break;
            case 1: //phil
                imgPath = @"philL" ;
                name = @"Phil Young" ;
                title = @"Sr. Associate Pastor" ;
                email = @"pyoung@westsidebaptist.org" ;
                break;
            case 6: //steve
                imgPath = @"steveL" ;
                name = @"Steve Loy" ;
                title = @"Minister of College" ;
                email = @"sloy@westsidebaptist.org" ;
                break;
            case 5: //chad
                imgPath = @"chadL" ;
                name = @"Chad Chadwick" ;
                title = @"Youth Pastor" ;
                email = @"gchadwick@westsidebaptist.org" ;
                break;
            case 7: //glen
                imgPath = @"glenL" ;
                name = @"Glen McKinney" ;
                title = @"Associate Paster, Senior Adult Minister" ;
                email = @"gmckinney@westsidebaptist.org" ;
                break;
            case 9: //tom
                imgPath = @"tomL" ;
                name = @"Tom Grubbs" ;
                title = @"Associate Pastor, Minister of Recreation" ;
                email = @"tgrubbs@westsidebaptist.org" ;
                break;
            case 3: //ron
                imgPath = @"ronL" ;
                name = @"Ron Surber" ;
                title = @"Minister of Education" ;
                email = @"rsurber@westsidebaptist.org" ;
                break;
            case 8: //sheryl
                imgPath = @"sherylL" ;
                name = @"Sheryl Bennett" ;
                title = @"Minister of Missions, Prayer and Evangelism" ;
                email = @"sbennett@westsidebaptist.org" ;
                break;
            case 4: //john
                imgPath = @"johnL" ;
                name = @"John Park" ;
                title = @"Minister to Children" ;
                email = @"jpark@westsidebaptist.org" ;
                break;
                
                
                
            default:
                break;
        }
               
    }
    
    return self;     
        
}

- (void)dealloc
{
    [super dealloc];
    if(webVC) [webVC release];
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
    
    [self setTitle:name];
    [nameLabel setText:name];
    [titleLabel setText:title];
    [image setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgPath ofType:@"png"]]];
    [nameLabel setText:name];
    [titleLabel setText:title];
    [image setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgPath ofType:@"png"]]];
    
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

-(void) pushWebWithLinkAndTitle:(NSString *)link:(NSString *)nav_title{
    if(webVC != nil) {
        [webVC release];
    }
    
    GenericWebNavViewController *aWebNavView = [[GenericWebNavViewController alloc] initWithLinkWithScale:link :YES];
    
    webVC =aWebNavView;
    
    aWebNavView.title = nav_title;
    aWebNavView.hidesBottomBarWhenPushed = YES;
    
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.connectNav pushViewController:webVC animated:YES]; 
    
    
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
    int number = 1;
    if(twitter) number++;
    if(facebook) number++;
    return number;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if (indexPath.row == 0) cell.textLabel.text = @"Send an Email";
    else if(twitter && indexPath.row == 1) cell.textLabel.text = @"Twitter Timeline";
    else if(facebook) cell.textLabel.text = @"Facebook Page";
    
    
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    
    [cell setBackgroundColor:[UIColor colorWithRed:.96 green:.94 blue:.90 alpha:1]];
    
    return cell;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //[[tableView cellForRowAtIndexPath:indexPath].textLabel.text isEqualToString:@"Send an Email"];
    
    if (indexPath.row == 0) { //email
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto:" stringByAppendingString:email]]];
    }
    else if (twitter && indexPath.row == 1) { //twitter
        NSLog(@"Twitter");
        [self pushWebWithLinkAndTitle:[@"http://mobile.twitter.com/" stringByAppendingString:twitter] :[@"@" stringByAppendingString:twitter]];
        
           }
    else if (facebook) { //facebook
        NSLog(@"Facebook");
        [self pushWebWithLinkAndTitle:[@"https://www.facebook.com/" stringByAppendingString: facebook] :@"Facebook"];
    }
    
       
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}





@end
