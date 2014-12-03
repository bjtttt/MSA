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
    
    [NSException raise:@"MeasBarParamDictBase::init" format:@"Call MeasBarParamDictBase::initWithConfig: instead"];
    
    return nil;
}

-(id) initWithConfig:(ShareSettings *)ss
{
    if ((self = [super init]))
    {
        _shareSettings = ss;
    }
    
    return self;
}

-(void)registerParameterEvent
{
    [NSException raise:@"ParamDictBase::init" format:@"ParamDictBase::registerParameterEvent should be override in each mode/meas."];
}

-(void)unregisterParameterEvent
{
    [NSException raise:@"ParamDictBase::unregisterParameterEvent" format:@"ParamDictBase::unregisterParameterEvent should be override in each mode/meas."];
}

-(void)parseParameter
{
    [NSException raise:@"ParamDictBase::parseParameter" format:@"ParamDictBase::parseParameter should be override in each mode/meas."];
}

-(void)addParameter:(Parameter *)par forKey:(NSString *)key
{
    [NSException raise:@"ParamDictBase::addParameter:forKey:" format:@"ParamDictBase::addParameter:forKey: should be override in each mode/meas."];
}

-(Parameter *)getParameterBy:(NSString *)key
{
    [NSException raise:@"ParamDictBase::getParameterBy:" format:@"ParamDictBase::getParameterBy: should be override in each mode/meas."];
    
    return nil;
}

-(bool)checkParameterBy:(NSString *)key
{
    [NSException raise:@"ParamDictBase::checkParameterBy" format:@"ParamDictBase::getParameterBy should be override in each mode/meas."];
    
    return NO;
}

@end
