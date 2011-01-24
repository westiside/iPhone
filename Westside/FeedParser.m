//
//  FeedParser.m
//  Westside
//
//  Created by Nick Eubanks on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FeedParser.h"


@implementation FeedParser
@synthesize audioFeeds;
@synthesize videoFeeds;


#pragma mark - Access Methods

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
    NSXMLParser *feedParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [feedParser setDelegate:self];
    [feedParser setShouldResolveExternalEntities:YES];
    [feedParser parse]; 

}


#pragma mark - Delegate Methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:@"title"] ) {
        currentStringValue = nil;
        return;
    } else
    
    if([elementName isEqualToString:@"link"] ) {
        currentStringValue = nil;
        return;
    } else
            
    if([elementName isEqualToString:@"pubDate"] ) {
        currentStringValue = nil;
        return;
    } else
            
    if([elementName isEqualToString:@"itunes:duration"] ) {
        currentStringValue = nil;
        return;
    } else
    
    return;
}
 

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentStringValue) {
        currentStringValue = [[NSMutableString alloc] initWithCapacity:50];
    }
    [currentStringValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    
    if ( [elementName isEqualToString:@"title"] ) {
        feedName = currentStringValue;
        isAudio = [feedName containsSubstring:@"Audio"];
        return;
    } else
        
    if([elementName isEqualToString:@"link"] ) {
        feedLink = currentStringValue;
        return;
    } else
        
    if([elementName isEqualToString:@"pubDate"] ) {
        pubDate = currentStringValue;
        return;
    } else
                
    if([elementName isEqualToString:@"itunes:duration"] ) {
        duration = currentStringValue;
        return;
    } else
    
    if ( [elementName isEqualToString:@"item"] ) {
        
        Feed *f = [[Feed alloc] init];
        [f setFeedName:[[feedName componentsSeparatedByString:@"\n"] objectAtIndex:0]];
        f.feedName = [[f.feedName componentsSeparatedByString:@" - "] objectAtIndex:0];
        [f setFeedLink:[[feedLink componentsSeparatedByString:@"\n"] objectAtIndex:0]];
        [f setIsAudio:isAudio];
        [f setDuration:[[duration componentsSeparatedByString:@"\n"] objectAtIndex:0]];
        [f setPubDate:[[pubDate componentsSeparatedByString:@"\n"] objectAtIndex:0]];
        
     
        
        if(isAudio){
            [audioFeeds addObject:f];
        } else{
            [videoFeeds addObject:f];
        }
        
        [f release];
        return;
        
    }else return;
    
}

- (void)dealloc {
    [audioFeeds release];
    [videoFeeds release];
    [super dealloc];
}


@end
