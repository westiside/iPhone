//
//  TwitterParser.m
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwitterParser.h"
#import "Tweet.h"

@implementation TwitterParser
@synthesize tweets;
@synthesize pic;

-(TwitterParser*)initWithScreenName: (NSString*)user{
    [super init];
    screen_name = user;
    picFound = NO;
    tweets = [[NSMutableArray alloc] init];
    
    return self;
}



-(void)dealloc{
    [tweets dealloc];
    [pic release];
    [super dealloc];
    
}


#pragma mark - Access Methods

-(void) parseXML{
    [tweets removeAllObjects];
    
    NSString *apiCall = [[@"http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=" stringByAppendingString:screen_name] stringByAppendingString:@"&count=10"];
    
    NSURL *xmlURL = [NSURL URLWithString:apiCall];
    NSXMLParser *feedParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [feedParser setDelegate:self];
    [feedParser setShouldResolveExternalEntities:YES];
    [feedParser parse]; 
    [feedParser release];
}

#pragma mark - Delegate Methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if(!picFound && [elementName isEqualToString:@"profile_image_url"]){
        currentStringValue = nil;
        return;
    } else
    
    if ([elementName isEqualToString:@"text"] ) {
        currentStringValue = nil;
        return;
    } else
        
    if([elementName isEqualToString:@"created_at"] ) {
        currentStringValue = nil;
        return;
    } else
    
    return;
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentStringValue) {
        currentStringValue = [[NSMutableString alloc] initWithCapacity:50];
    }
    currentStringValue = [currentStringValue stringByAppendingString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if(!picFound && [elementName isEqualToString:@"profile_image_url"]){
        NSURL *url = [NSURL URLWithString:currentStringValue];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        pic = img;
        picFound = YES;
        
        return;
    }
    
    if ( [elementName isEqualToString:@"created_at"] ) {
        NSArray *array = [currentStringValue componentsSeparatedByString:@"\n"];
        created_at = [array objectAtIndex:0];
        
        return;
    } else
        
    if([elementName isEqualToString:@"text"] ) {
        NSArray *array = [currentStringValue componentsSeparatedByString:@"\n"];
        text = [array objectAtIndex:0];
        
        Tweet *t = [[Tweet alloc] initWithTextAndDate:text:created_at];
        
        [tweets addObject:t];
        
        [t release];
    
        return;
                    
    }else return;
     
    
}



@end
