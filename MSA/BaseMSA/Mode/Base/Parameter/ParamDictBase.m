//
//  ParamDictBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParamDictBase.h"
#import "Parameter.h"

@interface ParamDictBase()

@end

@implementation ParamDictBase

-(id) init {
    if ((self = [super init]))
    {
    }
    
    return self;
}

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    _shareSettings = shareSettings;
}

-(void)registerParameterEvent
{
    NSAssert(YES==NO, @"ParamDictBase::registerParameterEvent should be override in each mode/meas.");
}

-(void)unregisterParameterEvent
{
    NSAssert(YES==NO, @"ParamDictBase::unregisterParameterEvent should be override in each mode/meas.");
}

-(void)parseParameter
{
    NSAssert(YES==NO, @"ParamDictBase::parseParameter should be override in each mode/meas.");
}

-(void)addParameter:(Parameter *)par withKey:(NSString *)key
{
    NSAssert(YES==NO, @"ParamDictBase::addParameter should be override in each mode/meas.");
}

-(Parameter *)getParameterBy:(NSString *)key
{
    NSAssert(YES==NO, @"ParamDictBase::getParameterBy should be override in each mode/meas.");
    
    return nil;
}

@end
