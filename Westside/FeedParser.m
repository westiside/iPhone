//
//  FeedParser.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "FeedParser.h"

@implementation FeedParser
@synthesize audioFeeds;
@synthesize videoFeeds;

-(FeedParser*) init{
    [super init];
    audioFeeds = [[NSMutableArray alloc] init];
    videoFeeds = [[NSMutableArray alloc] init];
    
    return self;
}

-(void)dealloc{
    [audioFeeds release];
    [videoFeeds release];
    
    [feedName release];
    [feedLink release];
    [pubDate release];
    [duration release];
    [image   release];
    [currentStringValue release];
    
    [super dealloc];
}


#pragma mark - Access Methods

-(void) parseXML{
    [audioFeeds removeAllObjects];
    [videoFeeds removeAllObjects];
    
    NSURL *xmlURL = [NSURL URLWithString:@"http://sermon.net/rss/wbcmedia/main_channel"];
    NSXMLParser *feedParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [feedParser setDelegate:self];
    [feedParser setShouldResolveExternalEntities:YES];
    [feedParser parse]; 
    [feedParser release];

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
        
    if([elementName isEqualToString:@"itunes:image href="] ) {
        currentStringValue = nil;
        return;
    }
    
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
        
    if([elementName isEqualToString:@"itunes:image href="] ) {
        if(image != nil) [image release];
        NSURL *url = [NSURL URLWithString:currentStringValue];
        NSData *data = [NSData dataWithContentsOfURL:url];
        image = [[UIImage alloc] initWithData:data];
        
    }

    
    if ( [elementName isEqualToString:@"item"] ) {
        
        Feed *f = [[Feed alloc] init];
        [f setFeedName:[[feedName componentsSeparatedByString:@"\n"] objectAtIndex:0]];
        f.feedName = [[f.feedName componentsSeparatedByString:@" - "] objectAtIndex:0];
        [f setFeedLink:[[feedLink componentsSeparatedByString:@"\n"] objectAtIndex:0]];
        [f setIsAudio:isAudio];
        [f setPubDate:[[[pubDate componentsSeparatedByString:@"\n"] objectAtIndex:0] substringWithRange:NSMakeRange(0, 17)]];
        [f setImage:image];
     
        
        if(isAudio){
            [audioFeeds addObject:f];
        } else{
            [videoFeeds addObject:f];
        }
        
        [f release];
        return;
        
    }else return;
    
}



@end
