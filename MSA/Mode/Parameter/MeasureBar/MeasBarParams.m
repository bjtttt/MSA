//
//  MeasBarParams.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasBarParams.h"
#import "ShareSettings.h"
#import "EnumMemberInfo.h"
#import "EnumParameter.h"
#import "BooleanParameter.h"
#import "AutoManParameter.h"
#import "OnOffParameter.h"
#import "DoubleParameter.h"
#import "TimeParameter.h"
#import "AmplitudeParameter.h"
#import "FrequencyParameter.h"
#import "RelativeAmplitudeParameter.h"
#import "IntParameter.h"
#import "StringParameter.h"
#import "ImmediateParameter.h"
#import "Parameter.h"
#import "ParameterManager.h"

@interface MeasBarParams()

@end

@implementation MeasBarParams

-(id) init {
    if ((self = [super init]))
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
    [self addBar0Parameters];
    [self addBar1Parameters];
    [self addBar2Parameters];
    [self addBar3Parameters];
    [self addBar4Parameters];
    [self addBar5Parameters];
    [self addBar6Parameters];
    [self addBar7Parameters];
}

-(void)addBar0Parameters
{
}

-(void)addBar1Parameters
{
    
}

-(void)addBar2Parameters
{
    
}

-(void)addBar3Parameters
{
    
}

-(void)addBar4Parameters
{
    
}

-(void)addBar5Parameters
{
    
}

-(void)addBar6Parameters
{
    
}

-(void)addBar7Parameters
{
    
}

@end
