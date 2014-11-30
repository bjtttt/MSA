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

-(void)addBarParameters
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
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar0Parameters should be override in each mode.");
}

-(void)addBar1Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar1Parameters should be override in each mode.");
}

-(void)addBar2Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar2Parameters should be override in each mode.");
}

-(void)addBar3Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar3Parameters should be override in each mode.");
}

-(void)addBar4Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar4Parameters should be override in each mode.");
}

-(void)addBar5Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar5Parameters should be override in each mode.");
}

-(void)addBar6Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar6Parameters should be override in each mode.");
}

-(void)addBar7Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar7Parameters should be override in each mode.");
}

-(void)addBar8Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar8Parameters should be override in each mode.");
}

-(void)addBar9Parameters
{
    NSAssert(YES==NO, @"MeasBarParamDictBase::addBar9Parameters should be override in each mode.");
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
