//
//  TwitterParser.h
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"

@interface TwitterParser : NSObject <NSXMLParserDelegate> {
@private
    NSString *text;
    NSString *created_at;
    NSString *screen_name;
    NSString *currentStringValue;
    BOOL picFound;
}

@property (nonatomic, retain) NSMutableArray* tweets;
@property (nonatomic, retain) UIImage* pic;



-(TwitterParser*) initWithScreenName:(NSString*)user;

-(void) parseXML;




@end
