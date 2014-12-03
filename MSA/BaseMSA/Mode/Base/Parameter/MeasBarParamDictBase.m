//
//  MeasureBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasBarParamDictBase.h"
#import "MeasParamDictBase.h"
#import "ModeParamDictBase.h"
#import "MeasureBase.h"

@interface MeasBarParamDictBase()

@end

@implementation MeasBarParamDictBase

-(id)init
{
    [NSException raise:@"MeasBarParamDictBase::init" format:@"Call MeasBarParamDictBase::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
        self.dictType = MBAR_DICT;
    }
    
    return self;
}

-(NSString *)modeName
{
    return (NSString *)_measPar.modeName;
}

-(NSString *)measName
{
    return (NSString *)_measure.measureName;
}

-(void)registerParameterEvent
{
    [NSException raise:@"MeasBarParamDictBase::registerParameterEvent" format:@"MeasBarParam::registerParameterEvent should be overrrided in each measurement."];
}

-(void)unregisterParameterEvent
{
    [NSException raise:@"MeasBarParamDictBase::unregisterParameterEvent" format:@"MeasBarParam::unregisterParameterEvent should be overrrided in each measurement."];
}

-(void)parseParameter
{
    [self parseBar0Parameters];
    [self parseBar1Parameters];
    [self parseBar2Parameters];
    [self parseBar3Parameters];
    [self parseBar4Parameters];
    [self parseBar5Parameters];
    [self parseBar6Parameters];
    [self parseBar7Parameters];
    [self parseBar8Parameters];
    [self parseBar9Parameters];
}

-(void)parseBar0Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar0Parameters" format:@"MeasBarParamDictBase::parseBar0Parameters should be override in each mode."];
}

-(void)parseBar1Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar1Parameters" format:@"MeasBarParamDictBase::parseBar1Parameters should be override in each mode."];
}

-(void)parseBar2Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar2Parameters" format:@"MeasBarParamDictBase::parseBar2Parameters should be override in each mode."];
}

-(void)parseBar3Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar3Parameters" format:@"MeasBarParamDictBase::parseBar3Parameters should be override in each mode."];
}

-(void)parseBar4Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar4Parameters" format:@"MeasBarParamDictBase::parseBar4Parameters should be override in each mode."];
}

-(void)parseBar5Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar5Parameters" format:@"MeasBarParamDictBase::parseBar5Parameters should be override in each mode."];
}

-(void)parseBar6Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar6Parameters" format:@"MeasBarParamDictBase::parseBar6Parameters should be override in each mode."];
}

-(void)parseBar7Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar7Parameters" format:@"MeasBarParamDictBase::parseBar7Parameters should be override in each mode."];
}

-(void)parseBar8Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar8Parameters" format:@"MeasBarParamDictBase::parseBar8Parameters should be override in each mode."];
}

-(void)parseBar9Parameters
{
    [NSException raise:@"MeasBarParamDictBase::parseBar9Parameters" format:@"MeasBarParamDictBase::parseBar9Parameters should be override in each mode."];
}

-(void)addParameter:(Parameter *)par forKey:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"MeasBarParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for meas(\"%@\").", self.measName];
    if(par == nil)
        [NSException raise:@"MeasBarParamDictBase::addParameter:forKey:" format:@"Cannot insert nil parameter into meas(\"%@\") meas parameter dictionary.", self.measName];
    if(key == nil)
        [NSException raise:@"MeasBarParamDictBase::addParameter:forKey:" format:@"Cannot insert nil key into meas(\"%@\") meas parameter dictionary.", self.measName];
    if(key.length <= 0)
        [NSException raise:@"MeasBarParamDictBase::addParameter:forKey:" format:@"Cannot insert empty key into meas(\"%@\") meas parameter dictionary.", self.measName];
   
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict != nil)
        [NSException raise:@"MeasBarParamDictBase::addParameter:forKey:" format:@"Cannot insert parameter(\"%@\") with the same key(\"%@\") into meas(\"%@\") meas parameter dictionary.", par, key, self.measName];
    
    [self.parDict setValue:par forKey:key];
}

-(Parameter *)getParameterBy:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"MeasBarParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for meas(\"%@\").", self.measName];
    if(key == nil)
        [NSException raise:@"MeasBarParamDictBase::getParameterBy:" format:@"Cannot use nil key for meas(\"%@\") meas parameter dictionary.", self.measName];
    if(key.length <= 0)
        [NSException raise:@"MeasBarParamDictBase::getParameterBy:" format:@"Cannot use empty key for meas(\"%@\") meas parameter dictionary.", self.measName];
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict == nil)
        [NSException raise:@"MeasBarParamDictBase::getParameterBy:" format:@"Cannot get parameter with the key(\"%@\") from meas(\"%@\") meas parameter dictionary.",  key, self.measName];

    return parInDict;
}

-(bool)checkParameterBy:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"MeasBarParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for meas(\"%@\").", self.measName];
    if(key == nil)
        [NSException raise:@"MeasBarParamDictBase::checkParameterBy:" format:@"Cannot use nil key for meas(\"%@\") meas parameter dictionary.", self.measName];
    if(key.length <= 0)
        [NSException raise:@"MeasBarParamDictBase::checkParameterBy:" format:@"Cannot use empty key for meas(\"%@\") meas parameter dictionary.", self.measName];

    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict != nil)
        return YES;
    else
        return NO;
}

@end
