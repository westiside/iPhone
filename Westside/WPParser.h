//
//  WPParser.h
//  Westside
//
//  Created by Nick Eubanks on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WPParser : NSObject <NSXMLParserDelegate> {
@private
    NSString *text;
    NSString *title;
    NSString *date;
    NSString *link;
    NSString *currentStringValue;
}


-(WPParser*) initWithLink:(NSString*)link;
@property (nonatomic, copy) NSString* sourceLink;

-(NSString*) parseXML;
-(NSString*) getLink;

@end
