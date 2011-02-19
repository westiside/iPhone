//
//  FeedParser.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
#define PODCASTFEED @"http://sermon.net/rss/wbcmedia/main_channel"
#define LIVEFEED @"http://wbcmedia.sermon.net/l/main"

@interface FeedParser : NSObject <NSXMLParserDelegate> {
@private
    NSString    *feedName;
    BOOL        isAudio;
    NSString    *feedLink;
    NSString    *pubDate;
    NSString    *duration;
    NSString    *currentStringValue;
    UIImage     *image;
}

@property (nonatomic, retain) NSMutableArray* audioFeeds;

@property (nonatomic, retain) NSMutableArray* videoFeeds;

-(FeedParser*) init;

-(void) parseXML;


@end
