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

-(id) init {
    if ((self = [super init]))
    {
        self.dictType = MBAR_DICT;
    }
    
    return self;
}

-(NSString *)modeName
{
    return (NSString *)self.modePar.modeName;
}

-(NSString *)measName
{
    return (NSString *)self.measure.measureName;
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
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar0Parameters should be override in each mode.");
}

-(void)parseBar1Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar1Parameters should be override in each mode.");
}

-(void)parseBar2Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar2Parameters should be override in each mode.");
}

-(void)parseBar3Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar3Parameters should be override in each mode.");
}

-(void)parseBar4Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar4Parameters should be override in each mode.");
}

-(void)parseBar5Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar5Parameters should be override in each mode.");
}

-(void)parseBar6Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar6Parameters should be override in each mode.");
}

-(void)parseBar7Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar7Parameters should be override in each mode.");
}

-(void)parseBar8Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar8Parameters should be override in each mode.");
}

-(void)parseBar9Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::parseBar9Parameters should be override in each mode.");
}

-(void)addParameter:(Parameter *)par forKey:(NSString *)key
{
    NSAssert(par != nil, @"Cannot insert nil parameter into meas %@ parameter dictionary.", self.measName);
    NSAssert(key != nil, @"Cannot insert nil key into meas %@ parameter dictionary.", self.measName);
    NSAssert(key.length > 0, @"Cannot insert empty key into meas %@ parameter dictionary.", self.measName);
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    NSAssert(parInDict == nil, @"Cannot insert parameter %@ with the same key %@ into meas %@ parameter dictionary.", par, key, self.measName);
    
    [self.parDict setValue:par forKey:key];
}

-(Parameter *)getParameterBy:(NSString *)key
{
    NSAssert(key != nil, @"Cannot use nil key for meas %@ parameter dictionary.", self.measName);
    NSAssert(key.length > 0, @"Cannot use empty key for meas %@ parameter dictionary.", self.measName);
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict == nil)
        parInDict = (Parameter *)[self.modePar getParameterBy:key];
    NSAssert(parInDict == nil, @"Cannot get parameter with key %@ from meas %@ parameter dictionary.", key, self.measName);
    
    return parInDict;
}

@end
