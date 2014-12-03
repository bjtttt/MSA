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
        _measParArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *)modeName
{
    return (NSString *)self.mode.modeName;
}

-(NSString *)measName
{
    return nil;
}

-(void)addMeasurePar:(MeasParamDictBase *)measPar
{
    [self.measParArray addObject:measPar];
}

-(void)parseParameter
{
    for (MeasParamDictBase *measPars in self.measParArray)
    {
        [measPars parseParameter];
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
    
    [self.parDict setValue:par forKey:key];
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

-(bool)CheckParameterBy:(NSString *)key
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

@end
