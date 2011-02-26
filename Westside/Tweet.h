//
//  Tweet.h
//  Westside
//
//  Created by Nick Eubanks on 2/2/11.
//  Copyright 2011 Westside Baptist Church. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Tweet : NSObject {
@private
    
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic) CGFloat height;

-(Tweet*) initWithTextAndDate:(NSString*)text_in:(NSString*)date_in;
-(void)dealloc;


@end
