//
//  WaveParams.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WaveParams.h"
#import "ShareSettings.h"

@interface WaveParams()

@end

@implementation WaveParams

-(instancetype)init
{
    [NSException raise:@"WaveParams::init" format:@"Call WaveParams::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
    }
    
    return self;
}

-(void)registerParameterEvent
{
    
}

-(void)unregisterParameterEvent
{
    
}

-(void)parseParameter
{
    
}

@end
