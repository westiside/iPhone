//
//  Feed.m
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import "Feed.h"


@implementation Feed
@synthesize feedLink;
@synthesize feedName;
@synthesize pubDate;
@synthesize isAudio;

-(void)dealloc{
    [feedLink release];
    [feedName release];
    [pubDate release];
    [super dealloc];
}

@end
