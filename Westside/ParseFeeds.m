//
//  ParseFeeds.m
//  Westside
//
//  Created by Nick Eubanks on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParseFeeds.h"


@implementation ParseFeeds
@synthesize audioFeeds;
@synthesize videoFeeds;

-(void) parseXML{
        
    if(audioFeeds){
       [audioFeeds release];
    }
    if(videoFeeds){
        [videoFeeds release]; 
    }
    audioFeeds = [[NSMutableArray alloc] init];
    videoFeeds = [[NSMutableArray alloc] init];
    
    NSURL *xmlURL = [NSURL URLWithString:@"http://sermon.net/rss/wbcmedia/main_channel"];
    NSXMLParser feedParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [feedParser setDelegate:self];
    [feedParser setShouldResolveExternalEntities:YES];
    [feedParser parse]; 

}



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ( [elementName isEqualToString:@"title"] ) {
        feedName = elementName;
        isAudio = [feedName containsSubstring:@"Audio"];
        return;
    } else
    
    if([elementName isEqualToString:@"link"] ) {
            feedLink = elementName;
            return;
    } else
            
    if([elementName isEqualToString:@"author"] ) {
        author = elementName;
        return;
    } else
            
    if([elementName isEqualToString:@"duration"] ) {
        duration = elementName;
        return;
    } else
    
    return;
}



- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    if ( [elementName isEqualToString:@"item"] ) {
        
        Feed f = [[Feed alloc] init];
        [f setFeedName:feedName];
        [f setFeedLink:feedLink];
        [f setIsAudio:isAudio];
        [f setDuration:duration];
        [f setAuthor:author];
        
        if(isAudio){
            [audioFeeds addObject:f];
        } else{
            [videoFeeds addObject:f];
        }
        
        return;
        
    }else return;
    
}

- (void)dealloc {
    [audioFeeds release];
    [videoFeeds release];
    [super dealloc];
}


@end
