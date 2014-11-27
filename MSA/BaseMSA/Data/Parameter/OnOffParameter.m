//
//  OnOffParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnOffParameter.h"

@interface OnOffParameter()

@end

@implementation OnOffParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_BOOL_ONOFF;
        self.yesLabel = [[NSMutableString alloc] initWithString:@"On"];
        self.yesLabelShort = [[NSMutableString alloc] initWithString:@"On"];
        self.noLabel = [[NSMutableString alloc] initWithString:@"Off"];
        self.noLabelShort = [[NSMutableString alloc] initWithString:@"Off"];
    }
    
    return self;
}

@end
