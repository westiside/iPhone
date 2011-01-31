//
//  Feed.h
//  Westside
//
//  Created by Nick Eubanks (naeubanks@gmail.com) on 1/22/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Feed : NSObject {
@private
    
}

@property (nonatomic, retain) NSString    *feedLink;
@property (nonatomic, retain) NSString    *feedName;
@property (nonatomic, retain) NSString    *pubDate;
@property (nonatomic)         BOOL        isAudio;

-(void)dealloc;

@end
