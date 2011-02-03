//
//  Tweet.h
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Tweet : NSObject {
@private
    
}

@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *created_at;

-(Tweet*) initWithTextAndDate:(NSString*)text_in:(NSString*)date_in;
-(void)dealloc;


@end
