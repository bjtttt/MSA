//
//  ParameterManager.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParameterManager.h"
#import "ModeParams.h"

@interface ParameterManager()

@end

@implementation ParameterManager

-(instancetype)init
{
    [NSException raise:@"ParameterManager::init" format:@"Call ParameterManager::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super init]))
    {
        _shareSettings = ss;
        _modePars = [[ModeParams alloc] initWithConfig:ss];
    }
    
    return self;
}

-(void)registerParameterChangedEvent
{
    [_modePars registerParameterEvent];
}

-(void)unregisterParameterChangedEvent
{
    [_modePars unregisterParameterEvent];
}

-(void)parseParameter
{
    [_modePars parseParameter];
}

@end
