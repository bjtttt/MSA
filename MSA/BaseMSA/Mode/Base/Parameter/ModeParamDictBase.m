//
//  ModeParamDictBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeParamDictBase.h"
#import "MeasParamDictBase.h"
#import "ModeBase.h"
#import "MeasureBase.h"

@interface ModeParamDictBase()

@end

@implementation ModeParamDictBase

-(id)init
{
    [NSException raise:@"ModeParamDictBase::init" format:@"Call ModeParamDictBase::initWithConfig: instead"];
    
    return nil;
}

-(id) initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
        self.dictType = MODE_DICT;
        self.parDict = [[NSMutableDictionary alloc] init];
        
        _measParDict = [[NSMutableDictionary  alloc] init];
    }
    
    return self;
}

-(NSString *)modeName
{
    return (NSString *)_mode.modeName;
}

-(NSString *)measName
{
    return nil;
}

-(void)addMeasurePar:(MeasParamDictBase *)measPar forKey:(NSString *)key
{
    if(_measParDict == nil)
        [NSException raise:@"ModeParamDictBase::addMeasurePar:forKey:" format:@"Cannot use nil measure parameter dictionary for mode(\"%@\").", self.modeName];
    if(measPar == nil)
        [NSException raise:@"ModeParamDictBase::addMeasurePar:forKey:" format:@"Cannot insert nil measure parameter for mode(\"%@\") measure parameter dictionary.", self.modeName];
    if(key == nil)
        [NSException raise:@"ModeParamDictBase::addMeasurePar:forKey:" format:@"Cannot insert nil key into mode(\"%@\") measure parameter dictionary.", self.modeName];
    if(key.length <= 0)
        [NSException raise:@"ModeParamDictBase::addMeasurePar:forKey:" format:@"Cannot insert empty key into mode(\"%@\") measure parameter dictionary.", self.modeName];

    if([self checkParameterBy:key] == YES)
        [NSException raise:@"ModeParamDictBase::checkParameterBy:" format:@"Cannot insert measure parameter with the same key(\"%@\") into mode(\"%@\") measure parameter dictionary.", key, self.modeName];
    
    _measParDict[key] = measPar;
}

-(void)parseParameter
{
    NSArray *keys = _measParDict.allKeys;
    for (NSString *key in keys)
    {
        MeasParamDictBase *measPar = (MeasParamDictBase *)_measParDict[key];
        [measPar parseParameter];
    }
}

-(void)addParameter:(Parameter *)par forKey:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"ModeParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for mode(\"%@\").", self.modeName];
    if(par == nil)
        [NSException raise:@"ModeParamDictBase::addParameter:forKey:" format:@"Cannot insert nil parameter into mode(\"%@\") mode parameter dictionary.", self.modeName];
    if(key == nil)
        [NSException raise:@"ModeParamDictBase::addParameter:forKey:" format:@"Cannot insert nil key into mode(\"%@\") mode parameter dictionary.", self.modeName];
    if(key.length <= 0)
        [NSException raise:@"ModeParamDictBase::addParameter:forKey:" format:@"Cannot insert empty key into mode(\"%@\") mode parameter dictionary.", self.modeName];
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict != nil)
        [NSException raise:@"ModeParamDictBase::addParameter:forKey:" format:@"Cannot insert parameter(\"%@\") with the same key(\"%@\") into mode(\"%@\") mode parameter dictionary.", par, key, self.modeName];
    
    self.parDict[key] = par;
}

-(Parameter *)getParameterBy:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"ModeParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for mode(\"%@\").", self.modeName];
    if(key == nil)
        [NSException raise:@"ModeParamDictBase::getParameterBy:" format:@"Cannot use nil key for mode(\"%@\") mode parameter dictionary.", self.modeName];
    if(key.length <= 0)
        [NSException raise:@"ModeParamDictBase::getParameterBy:" format:@"Cannot use empty key for mode(\"%@\") mode parameter dictionary.", self.modeName];
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict == nil)
        [NSException raise:@"ModeParamDictBase::getParameterBy:" format:@"Cannot get parameter with the key(\"%@\") from mode(\"%@\") mode parameter dictionary.",  key, self.modeName];
    
    return parInDict;
}

-(bool)checkParameterBy:(NSString *)key
{
    if(self.parDict == nil)
        [NSException raise:@"ModeParamDictBase::getParameterBy:" format:@"Cannot use nil data dictionary for mode(\"%@\").", self.modeName];
    if(key == nil)
        [NSException raise:@"ModeParamDictBase::CheckParameterBy:" format:@"Cannot use nil key for mode(\"%@\") mode parameter dictionary.", self.modeName];
    if(key.length <= 0)
        [NSException raise:@"ModeParamDictBase::CheckParameterBy:" format:@"Cannot use empty key for mode(\"%@\") mode parameter dictionary.", self.modeName];
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    if(parInDict != nil)
        return YES;
    else
        return NO;
}

-(MeasParamDictBase *)getMeasureParByKey:(NSString *)key
{
    if(_measParDict == nil)
        [NSException raise:@"ModeParamDictBase::getMeasureParByName:" format:@"Cannot use nil measure parameter dictionary for mode(\"%@\").", self.modeName];
    if(key == nil)
        [NSException raise:@"ModeParamDictBase::getMeasureParByName:" format:@"Cannot use nil measure name for mode(\"%@\") measure parameter dictionary.", self.modeName];
    if(key.length <= 0)
        [NSException raise:@"ModeParamDictBase::getMeasureParByName:" format:@"Cannot use empty measure name mode(\"%@\") for measure parameter dictionary.", self.modeName];
    
    MeasParamDictBase *measPar = (MeasParamDictBase *)_measParDict[key];
    if(measPar == nil)
        [NSException raise:@"ModeParamDictBase::getMeasureParByName:" format:@"Cannot get measure parameter with the key(\"%@\") from mode(\"%@\") mode parameter dictionary.",  key, self.modeName];
    
    return measPar;
}

-(bool)checkMeasureParByKey:(NSString *)key
{
    if(_measParDict == nil)
        [NSException raise:@"ModeParamDictBase::getMeasureParByName:" format:@"Cannot use nil measure parameter dictionary for mode(\"%@\").", self.modeName];
    if(key == nil)
        [NSException raise:@"ModeParamDictBase::addParameter:forKey:" format:@"Cannot use nil measure name for mode(\"%@\") measure parameter dictionary.", self.modeName];
    if(key.length <= 0)
        [NSException raise:@"ModeParamDictBase::addParameter:forKey:" format:@"Cannot use empty measure name mode(\"%@\") for measure parameter dictionary.", self.modeName];

    MeasParamDictBase *measPar = (MeasParamDictBase *)_measParDict[key];
    if(measPar == nil)
        return NO;
    else
        return YES;
}

@end
