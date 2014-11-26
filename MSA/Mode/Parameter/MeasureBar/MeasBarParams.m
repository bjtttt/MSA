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
    NSAssert(YES==NO, @"MeasBarParam::registerParameterEvent should be overrrided in each measurement.");
}

-(void)unregisterParameterEvent
{
    NSAssert(YES==NO, @"MeasBarParam::unregisterParameterEvent should be overrrided in each measurement.");
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
    [self addBar8Parameters];
    [self addBar9Parameters];
}

-(void)addBar0Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar0Parameters should be overrrided in each measurement.");
}

-(void)addBar1Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar1Parameters should be overrrided in each measurement.");
}

-(void)addBar2Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar2Parameters should be overrrided in each measurement.");
}

-(void)addBar3Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar3Parameters should be overrrided in each measurement.");
}

-(void)addBar4Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar4Parameters should be overrrided in each measurement.");
}

-(void)addBar5Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar5Parameters should be overrrided in each measurement.");
}

-(void)addBar6Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar6Parameters should be overrrided in each measurement.");
}

-(void)addBar7Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar7Parameters should be overrrided in each measurement.");
}

-(void)addBar8Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar8Parameters should be overrrided in each measurement.");
}

-(void)addBar9Parameters
{
    NSAssert(YES==NO, @"MeasBarParam::addBar9Parameters should be overrrided in each measurement.");
}

-(void)setBarWidth
{
    NSAssert(YES==NO, @"MeasBarParam::setBarWidth should be overrrided in each measurement.");
}

-(void)initMeasBarDetail
{
    NSAssert(YES==NO, @"MeasBarParam::initMeasBarDetail should be overrrided in each measurement.");
}

@end
