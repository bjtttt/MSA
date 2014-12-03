//
//  ModeBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeBase.h"
#import "ParameterManager.h"
#import "ShareSettings.h"
#import "ModeParamDictBase.h"
#import "ModeParams.h"
#import "MeasureBase.h"

@interface ModeBase()

@end

@implementation ModeBase

-(id)init
{
    [NSException raise:@"ModeBase::init" format:@"Call ModeBase::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super init]))
    {
        _shareSettings = ss;
        _measureDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void)switchMeasurement:(MeasureBase *)curMeas
{
    [NSException raise:@"ModeBase::switchMeasurement:" format:@"ModeBase::switchMeasure: should be override in each mode."];
}

-(void)initMode
{
    if([_shareSettings.parManager.modePars isKindOfClass:ModeParamDictBase.class] == NO)
        [NSException raise:@"ModeBase::initMode" format:@"Mode parameter dictionary in mode of parameter manager is not a child of ModeParamDictBase."];
    _modeParDict = (ModeParamDictBase *)_shareSettings.parManager.modePars;
    //[NSException raise:@"ModeBase::initMode" format:@"ModeBase::initMode should be override in each mode."];
}

-(void)initMeasurement
{
    NSArray *vals = _measureDict.allValues;
    for (MeasureBase *mb in vals)
    {
        mb.measParDict = _shareSettings.parManager.modePars.measParDict[mb.measureName];
    }
    //[NSException raise:@"ModeBase::initMeasurement" format:@"ModeBase::initMeasurement should be override in each mode."];
}

@end
