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

-(instancetype)init
{
    [NSException raise:@"OnOffParameter::init" format:@"Call OnOffParameter::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_BOOL_ONOFF;
        self.yesLabel = @"On";
        self.yesLabelShort = @"On";
        self.noLabel = @"Off";
        self.noLabelShort = @"Off";
    }
    
    return self;
}

@end
