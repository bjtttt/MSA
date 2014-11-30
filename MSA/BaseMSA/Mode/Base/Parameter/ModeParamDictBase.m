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

-(id) init {
    if ((self = [super init]))
    {
        self.parDict = [[NSMutableDictionary alloc] init];
        self.measParArray = [[NSMutableArray alloc] init];
        self.dictType = MODE_DICT;
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

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    [super setShareSettings:shareSettings];
    
    for (MeasParamDictBase *measPars in self.measParArray)
    {
        measPars.shareSettings = shareSettings;
    }
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
    NSAssert(par != nil, @"Cannot insert nil parameter into mode %@ parameter dictionary.", self.modeName);
    NSAssert(key != nil, @"Cannot insert nil key into mode %@ parameter dictionary.", self.modeName);
    NSAssert(key.length > 0, @"Cannot insert empty key into mode %@ parameter dictionary.", self.modeName);
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    NSAssert(parInDict == nil, @"Cannot insert parameter %@ with the same key %@ into mode %@ parameter dictionary.", par, key, self.modeName);
    
    [self.parDict setValue:par forKey:key];
}

-(Parameter *)getParameterBy:(NSString *)key
{
    NSAssert(key != nil, @"Cannot use nil key for mode %@ parameter dictionary.", self.modeName);
    NSAssert(key.length > 0, @"Cannot use empty key for mode %@ parameter dictionary.", self.modeName);
    
    Parameter *parInDict = (Parameter *)[self.parDict objectForKey:key];
    NSAssert(parInDict == nil, @"Cannot get parameter with key %@ from mode %@ parameter dictionary.", key, self.modeName);
    
    return parInDict;
}

@end
