//
//  MeasParamDictBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeParamDictBase.h"
#import "MeasParamDictBase.h"
#import "MeasBarParamDictBase.h"
#import "MeasureBase.h"
#import "ModeBase.h"

@interface MeasParamDictBase()

@end

@implementation MeasParamDictBase

-(id)init
{
    [NSException raise:@"MeasParamDictBase::init" format:@"Call MeasParamDictBase::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
        self.parDict = [[NSMutableDictionary alloc] init];
        self.dictType = MEAS_DICT;
    }
    
    return self;
}

-(void)registerParameterEvent
{
    [NSException raise:@"MeasParamDictBase::registerParameterEvent" format:@"MeasParamDictBase::registerParameterEvent should be overrrided in each measurement."];
}

-(void)unregisterParameterEvent
{
    [NSException raise:@"MeasParamDictBase::unregisterParameterEvent" format:@"MeasParamDictBase::unregisterParameterEvent should be overrrided in each measurement."];
}

-(void)parseParameter
{
    [self addMeasBarParameters];
    [self addMeasMenuParameters];
    [self addMeasOtherParameters];
}

-(void)addMeasBarParameters
{
    [_mbarPar parseParameter];
}

-(void)addMeasMenuParameters
{
    [NSException raise:@"MeasParamDictBase::addMeasMenuParameters" format:@"MeasParamDictBase::addMeasMenuParameters should be overrrided in each measurement."];
}

-(void)addMeasOtherParameters
{
    [NSException raise:@"MeasParamDictBase::addMeasOtherParameters" format:@"MeasParamDictBase::addMeasOtherParameters should be overrrided in each measurement."];
}

-(void)addParameter:(Parameter *)par forKey:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"MeasParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for meas(\"%@\").", self.measure.measureName];
    if(par == nil)
        [NSException raise:@"MeasParamDictBase::addParameter:forKey:" format:@"Cannot insert nil parameter into meas(\"%@\") meas parameter dictionary.", self.measure.measureName];
    if(key == nil)
        [NSException raise:@"MeasParamDictBase::addParameter:forKey:" format:@"Cannot insert nil key into meas(\"%@\") meas parameter dictionary.", self.measure.measureName];
    if(key.length <= 0)
        [NSException raise:@"MeasParamDictBase::addParameter:forKey:" format:@"Cannot insert empty key into meas(\"%@\") meas parameter dictionary.", self.measure.measureName];
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict != nil)
        [NSException raise:@"MeasParamDictBase::addParameter:forKey:" format:@"Cannot insert parameter(\"%@\") with the same key(\"%@\") into meas(\"%@\") meas parameter dictionary.", par, key, self.measure.measureName];
    
    [self.parDict setValue:par forKey:key];
}

-(Parameter *)getParameterBy:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"MeasParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for meas(\"%@\").", self.measure.measureName];
    if(key == nil)
        [NSException raise:@"MeasParamDictBase::getParameterBy:" format:@"Cannot use nil key for meas(\"%@\") meas parameter dictionary.", self.measure.measureName];
    if(key.length <= 0)
        [NSException raise:@"MeasParamDictBase::getParameterBy:" format:@"Cannot use empty key for meas(\"%@\") meas parameter dictionary.", self.measure.measureName];
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict == nil)
        [NSException raise:@"MeasParamDictBase::getParameterBy:" format:@"Cannot get parameter with the key(\"%@\") from meas(\"%@\") meas parameter dictionary.",  key, self.measure.measureName];
    
    return parInDict;
}

-(bool)checkParameterBy:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"MeasParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for meas(\"%@\").", self.measure.measureName];
    if(key == nil)
        [NSException raise:@"MeasParamDictBase::checkParameterBy:" format:@"Cannot use nil key for meas(\"%@\") meas parameter dictionary.", self.measure.measureName];
    if(key.length <= 0)
        [NSException raise:@"MeasParamDictBase::checkParameterBy:" format:@"Cannot use empty key for meas(\"%@\") meas parameter dictionary.", self.measure.measureName];
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict != nil)
        return YES;
    else
        return NO;
}

@end
