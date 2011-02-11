//
//  ConnectViewController.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/31/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "ConnectViewController.h"
#import "WestsideAppDelegate.h"

@implementation ConnectViewController
@synthesize twitterView;
@synthesize webVC;
@synthesize staffCell;

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
    
    //Hides Navigation Bar
    //WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    //[delegate.connectNav setNavigationBarHidden:YES]; 
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Loading Table View");
    switch(section){
        case 0: return 1;
        case 1: return 2;
        case 2: return 11;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(indexPath.section == 0){
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        }
        
        cell.textLabel.text = @"Week of Jan 30";
        cell.detailTextLabel.text = @"In 1955, “Gunsmoke” began its twenty year run on prime time television. John Wayne was asked to star...";
        

    }else if(indexPath.section == 1) {
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }

        
        if(indexPath.row ==0 && indexPath.section == 1) cell.textLabel.text = @"@wbcgainesville";
        else if(indexPath.row ==1 && indexPath.section == 1) cell.textLabel.text = @"@westsidecollege";
        
    }else if(indexPath.section == 2){
        static NSString *MyIdentifier = @"TweetCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"StaffTableViewCellNib" owner:self options:nil];
            cell = staffCell;
            staffCell = nil;
        }
        
        
        
        UILabel *name = (UILabel *)[cell viewWithTag:1];
        UILabel *title = (UILabel *)[cell viewWithTag:2];
        UILabel *email = (UILabel *)[cell viewWithTag:3];
        NSString *imgPath = @"chad";
      
        
        switch (indexPath.row) {
            case 0: //gary
                imgPath = @"gary";
                name.text = @"Gary Crawford";
                title.text = @"Senior Pastor";
                email.text = @"dmcalhany@westsidebaptist.org";
                break;
            case 1: //daniel
                imgPath = @"daniel" ;
                name.text = @"Daniel Morris" ;
                title.text = @"Associate Pastor, Minister of Music" ;
                email.text = @"dmorris@westsidebaptist.org" ;
                break;
            case 2: //mike
                imgPath = @"mike" ;
                name.text = @"Mike Ricks" ;
                title.text = @"Associate Minister of Music and Media" ;
                email.text = @"mricks@westsidebaptist.org" ;
                break;
            case 3: //phil
                imgPath = @"phil" ;
                name.text = @"Phil Young" ;
                title.text = @"Sr. Associate Pastor" ;
                email.text = @"pyoung@westsidebaptist.org" ;
                break;
            case 4: //steve
                imgPath = @"steve" ;
                name.text = @"Steve Loy" ;
                title.text = @"Minister of College" ;
                email.text = @"sloy@westsidebaptist.org" ;
                break;
            case 5: //chad
                imgPath = @"chad" ;
                name.text = @"Chad Chadwick" ;
                title.text = @"Youth Pastor" ;
                email.text = @"gchadwick@westsidebaptist.org" ;
                break;
            case 6: //glen
                imgPath = @"glen" ;
                name.text = @"Glen McKinney" ;
                title.text = @"Associate Paster, Senior Adult Minister" ;
                email.text = @"gmckinney@westsidebaptist.org" ;
                break;
            case 7: //tom
                imgPath = @"tom" ;
                name.text = @"Tom Grubbs" ;
                title.text = @"Associate Pastor, Minister of Recreation" ;
                email.text = @"tgrubbs@westsidebaptist.org" ;
                break;
            case 8: //ron
                imgPath = @"ron" ;
                name.text = @"Ron Surber" ;
                title.text = @"Minister of Education" ;
                email.text = @"rsurber@westsidebaptist.org" ;
                break;
            case 9: //sheryl
                imgPath = @"sheryl" ;
                name.text = @"Sheryl Bennett" ;
                title.text = @"Minister of Missions, Prayer and Evangelism" ;
                email.text = @"sbennett@westsidebaptist.org" ;
                break;
            case 10: //john
                imgPath = @"john" ;
                name.text = @"John Park" ;
                title.text = @"Minister to Children" ;
                email.text = @"jpark@westsidebaptist.org" ;
                break;
                
                
                
            default:
                break;
        }
                
        cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgPath ofType:@"png"]];
        
        return cell;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section){
        case 0: return @"Pastor's Perspective";
        case 1: return @"Westside on Twitter";
        case 2: return @"Church Staff";
    }
           
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==2)  return 82;
    else return 44;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 1){
        if(twitterView != nil) {
            [twitterView release];
        }
           
        TwitterViewController *aTwitterView = [[TwitterViewController alloc] initWithNibName:@"TwitterViewController"bundle:nil];
        twitterView = aTwitterView;
            
        
        
        if(indexPath.row ==0 && indexPath.section == 1) twitterView.title = @"@wbcgainesville";
        else if(indexPath.row ==1 && indexPath.section == 1) twitterView.title = @"@westsidecollege";
        
        twitterView.hidesBottomBarWhenPushed = YES;
        
        WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.connectNav pushViewController:twitterView animated:YES]; 
        
    }
    else if(indexPath.section == 0){
       
        [self pushWebWithLinkAndTitle:@"http://www.westsidemediaministry.com/who-we-are/pastors-perspectives/":@"Pastor's Perspective"];
        
    } else if (indexPath.section == 2){
        
               
    }
    
}

#pragma mark - NavPusher

-(void) pushWebWithLinkAndTitle:(NSString *)link:(NSString *)title{
    if(webVC != nil) {
        [webVC release];
    }
    
    GenericWebNavViewController *aWebNavView = [[GenericWebNavViewController alloc] initWithLinkAndIsConnect:link :YES];
    
    webVC =aWebNavView;
    
    aWebNavView.title = title;
    aWebNavView.hidesBottomBarWhenPushed = YES;
    
    WestsideAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.connectNav pushViewController:webVC animated:YES]; 
    
}

@end
