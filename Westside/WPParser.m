//
//  WPParser.m
//  Westside
//
//  Created by Nick Eubanks on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WPParser.h"


@implementation WPParser
@synthesize sourceLink;

-(WPParser*) initWithLink:(NSString*)link_in{
    self = [super init];
    if(self){
        sourceLink = [link_in copy];
    }
    
    return self;
}

-(void) dealloc{
    [super dealloc];
    [sourceLink release];
}

#pragma mark - Access Methods

-(NSString*) parseXML{
    
    NSString *apiCall = sourceLink;    
    NSURL *xmlURL = [NSURL URLWithString:apiCall];
    
    //work around apple bug that leaks nsconcrete map and mallocs
    NSData *xml = [NSData dataWithContentsOfURL:xmlURL];
    if(xml!=nil){
        NSXMLParser *feedParser = [[NSXMLParser alloc] initWithData:xml];
    
        [feedParser setDelegate:self];
        [feedParser setShouldResolveExternalEntities:YES];
        [feedParser parse]; 
        [feedParser release];
    
        return [[[[@"<h1 style=\"text-align: left;\"><span style=\"color: rgb(139, 69, 19); \">" stringByAppendingString:title] stringByAppendingString:@"</span></h1><div>"] stringByAppendingString:text] stringByAppendingString:@"</div><div><br /></div><div><br /></div><div><br /></div><div>"];//<span style=\"font-style: italic;\">Read More: "] stringByAppendingString:link] stringByAppendingString:@"</span></div>"];
    }else return @"<h1>Error Loading</h1><div>Please try again later</div>";
    
}

-(NSString*)getLink{
    if(!link){
        [self parseXML];
    }
    
    return link;
}

#pragma mark - Delegate Methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
   if ([elementName isEqualToString:@"title"] ) {
        currentStringValue = nil;
        return;
    } else
        
        if([elementName isEqualToString:@"description"] ) {
            currentStringValue = nil;
            return;
        } else
            
            if([elementName isEqualToString:@"link"] ) {
                currentStringValue = nil;
                return;
                
                
            } else return;
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentStringValue) {
        currentStringValue = [NSMutableString stringWithCapacity:50];
    }
    currentStringValue = [currentStringValue stringByAppendingString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    if ( [elementName isEqualToString:@"title"] ) {
        NSArray *array = [currentStringValue componentsSeparatedByString:@"\n"];
        title = [array objectAtIndex:0];
        
    } else
        
        if([elementName isEqualToString:@"description"] ) {
            NSArray *array = [currentStringValue componentsSeparatedByString:@"\n"];
            text = [array objectAtIndex:0];
            
            
        } else
            
            if([elementName isEqualToString:@"link"] ) {
                NSArray *array = [currentStringValue componentsSeparatedByString:@"\n"];
                link = [array objectAtIndex:0];
                
                
                
            }
    
    
    return;
    
    
}



@end
