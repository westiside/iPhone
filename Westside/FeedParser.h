//
//  FeedParser.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
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

@property (nonatomic) NSMutableArray* audioFeeds;

@property (nonatomic) NSMutableArray* videoFeeds;

-(FeedParser*) init;

-(void) parseXML;

@end
