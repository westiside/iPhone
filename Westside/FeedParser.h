//
//  FeedParser.h
//  Westside
//
//  Created by Nick Eubanks on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"


@interface FeedParser : NSObject {
@private
    NSString    *feedName;
    BOOL        isAudio;
    NSString    *feedLink;
    NSString    *pubDate;
    NSString    *duration;
    NSString    *currentStringValue;
}

@property (nonatomic, retain) NSMutableArray* audioFeeds;

@property (nonatomic, retain) NSMutableArray* videoFeeds;

-(void) parseXML;

@end
