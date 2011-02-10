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
@synthesize height;

-(void)dealloc{
    [text release];
    [created_at release];
    [super dealloc];
}

-(Tweet*)initWithTextAndDate:(NSString*)text_in:(NSString*)date_in{
    [super   init];
    
    text = text_in;

    CGSize constraintSize = CGSizeMake(200.0f, MAXFLOAT);
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:15];
    CGSize labelSize = [text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    height = labelSize.height + 24;
    
    
    //Format: Sun Jan 09 15:11:54 +0000 2011
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"EEE MMM d HH:mm:ss ZZZ yyyy"];
    NSDate *formatterDate = [inputFormatter dateFromString:date_in];
    
    NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
    [outputFormatter1 setDateFormat:@"h:mm"];
    NSString *str1 = [outputFormatter1 stringFromDate:formatterDate];;
    
    NSDateFormatter *outputFormatter2 = [[NSDateFormatter alloc] init];
    [outputFormatter2 setDateFormat:@" 'on' MMM d, yyyy"];
    NSString *str3 = [outputFormatter2 stringFromDate:formatterDate];;
    
    NSDateFormatter *ampm = [[NSDateFormatter alloc] init];
    [ampm setDateFormat:@"a"];    
    NSString *str2 = [ampm stringFromDate:formatterDate];
    
    NSString *newDateString = [str1 stringByAppendingString:[[str2 lowercaseString] stringByAppendingString:str3]];
    
    created_at = [newDateString copy];
    //self.created_at = newDateString;
        
    return self;
}



@end
