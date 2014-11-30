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

-(id) init {
    if ((self = [super init]))
    {
        self.parDict = [[NSMutableDictionary alloc] init];
        self.dictType = MEAS_DICT;
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

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    [super setShareSettings:shareSettings];
    
    self.mbarPar.shareSettings = shareSettings;
}

-(void)registerParameterEvent
{
    NSAssert(YES==NO, @"MeasParamDictBase::registerParameterEvent should be overrrided in each measurement.");
}

-(void)unregisterParameterEvent
{
    NSAssert(YES==NO, @"MeasParamDictBase::unregisterParameterEvent should be overrrided in each measurement.");
}

-(void)parseParameter
{
    [self addMeasBarParameters];
    [self addMeasMenuParameters];
    [self addMeasOtherParameters];
}

-(void)addMeasBarParameters
{
    NSAssert(YES==NO, @"MeasParamDictBase::addMeasBarParameters should be overrrided in each measurement.");
}

-(void)addMeasMenuParameters
{
    NSAssert(YES==NO, @"MeasParamDictBase::addMeasMenuParameters should be overrrided in each measurement.");
}

-(void)addMeasOtherParameters
{
    NSAssert(YES==NO, @"MeasParamDictBase::addMeasOtherParameters should be overrrided in each measurement.");
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
