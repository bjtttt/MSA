//
//  Parameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parameter.h"

@interface Parameter()

@end

@implementation Parameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_NONE;
        self.isStandardKey = YES;
        self.label = [[NSMutableString alloc] initWithString:@"Off"];
        self.labelShort = [[NSMutableString alloc] initWithString:@"Off"];
    }
    
    return self;
}

@end
