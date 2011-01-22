//
//  ParseFeeds.h
//  Westside
//
//  Created by Nick Eubanks on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSXMLParser.h"
#import "Feed.h"

@interface ParseFeeds : NSObject {
@private
    NSString    *feedName;
    BOOL        isAudio;
    NSString    *feedLink;
    NSString    *pubDate;
    NSString    *author;
    NSString   *duration;
    
}

@property (nonatomic, retain) NSMutableArray* audioFeeds;
@property (nonatomic, retain) NSMutableArray* videoFeeds;

-(void) parseXML;

@end
