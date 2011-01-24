//
//  Feed.h
//  Westside
//
//  Created by Nick Eubanks on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Feed : NSObject {
@private
    
}

@property (nonatomic, retain) NSString    *feedLink;
@property (nonatomic, retain) NSString    *feedName;
@property (nonatomic, retain) NSString    *pubDate;
@property (nonatomic, retain) NSString    *duration;
@property (nonatomic)         BOOL        isAudio;

@end
