//
//  OnOffParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnOffParameter.h"
//#import "Parameter.h"

@interface OnOffParameter()

@end

@implementation OnOffParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_BOOL_ONOFF;
    }
    
    return self;
}

@end
