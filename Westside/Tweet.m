//
//  Tweet.m
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tweet.h"


@implementation Tweet
@synthesize text;
@synthesize created_at;

-(void)dealloc{
    [text release];
    [created_at release];
    [super dealloc];
}

-(Tweet*)initWithTextAndDate:(NSString*)text_in:(NSString*)date_in{
    [super   init];
    text = text_in;
    created_at = date_in;
    
    return self;
}



@end
