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
@synthesize twitterView;

- (id)initWithID:(int)ID{
    self = [super init];
    if(self){        
        switch (ID) {
                /*
                 Add the following to support twitter or facebook for each staff:
                    twitter = @"account_name";
                    facebook = @"account_name";
                 */
            case 0: //gary
                imgPath = @"garyL";
                name = @"Gary Crawford";
                title = @"Senior Pastor";
                email = @"dmcalhany@westsidebaptist.org";
                twitter = @"GaryLCrawford";
                facebook = @"pastorgarycrawford";
                break;
            case 2: //daniel
                imgPath = @"danielL" ;
                name = @"Daniel Morris" ;
                title= @"Associate Pastor, Minister of Music" ;
                email = @"dmorris@westsidebaptist.org" ;
                twitter = @"danielcmorris";
                facebook = @"danielmorrismusic";
                break;
            case 10: //mike
                imgPath = @"mikeL" ;
                name = @"Mike Ricks" ;
                title = @"Associate Minister of Music and Media" ;
                email = @"mricks@westsidebaptist.org" ;
                twitter = @"MikeRicks";
                facebook = @"profile.php?id=502224708";
                break;
            case 1: //phil
                imgPath = @"philL" ;
                name = @"Phil Young" ;
                title = @"Sr. Associate Pastor" ;
                email = @"pyoung@westsidebaptist.org" ;
                facebook = @"profile.php?id=723678730";
                break;
            case 6: //steve
                imgPath = @"steveL" ;
                name = @"Steve Loy" ;
                title = @"Minister of College" ;
                email = @"sloy@westsidebaptist.org" ;
                twitter = @"StephenL1971";
                facebook = @"profile.php?id=1185700847";
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
                twitter = @"GlenMcKinney";
                facebook = @"glen.mckinney2";
                break;
            case 9: //tom
                imgPath = @"tomL" ;
                name = @"Tom Grubbs" ;
                title = @"Associate Pastor, Minister of Recreation" ;
                email = @"tgrubbs@westsidebaptist.org" ;
                twitter = @"RecreationTom";
                facebook = @"profile.php?id=1459236300";
                break;
            case 3: //ron
                imgPath = @"ronL" ;
                name = @"Ron Surber" ;
                title = @"Minister of Education" ;
                email = @"rsurber@westsidebaptist.org" ;
                twitter = @"RonSurber";
                facebook = @"profile.php?id=1181351406";
                break;
            case 8: //sheryl
                imgPath = @"sherylL" ;
                name = @"Sheryl Bennett" ;
                title = @"Minister of Missions, Prayer and Evangelism" ;
                email = @"sbennett@westsidebaptist.org" ;
                facebook = @"Sbennett623";
                break;
            case 4: //john
                imgPath = @"johnL" ;
                name = @"John Park" ;
                title = @"Minister to Children" ;
                email = @"jpark@westsidebaptist.org" ;
                facebook = @"profile.php?id=100000752403948";
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
    if(twitterView) [twitterView release];
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
    
    [cell setBackgroundColor:[UIColor colorWithRed:1 green:.98 blue:.94 alpha:1]];
    
    return cell;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //[[tableView cellForRowAtIndexPath:indexPath].textLabel.text isEqualToString:@"Send an Email"];
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You must have an active network connection in order to view this page." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [alert release];
        
    } else{
        
        if (indexPath.row == 0) { //email
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto:" stringByAppendingString:email]]];
        }
        else if (twitter && indexPath.row == 1) { //twitter
            if(twitterView != nil) {
                [twitterView release];
            }
            
            TwitterViewController *aTwitterView = [[TwitterViewController alloc] initWithNibName:@"TwitterViewController"bundle:nil];
            twitterView = aTwitterView;
            
            twitterView.title = twitter;
            
            twitterView.hidesBottomBarWhenPushed = YES;
            
            WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            [delegate.connectNav pushViewController:twitterView animated:YES]; 
            
            //[self pushWebWithLinkAndTitle:[@"http://mobile.twitter.com/" stringByAppendingString:twitter] :[@"@" stringByAppendingString:twitter]];
            
        }
        else if (facebook) { //facebook
            [self pushWebWithLinkAndTitle:[@"http://m.facebook.com/" stringByAppendingString: facebook] :@"Facebook"];
        }
    }
    
       
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}





@end
