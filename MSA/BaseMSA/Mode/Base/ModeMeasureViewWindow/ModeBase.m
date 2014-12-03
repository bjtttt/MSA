//
//  ModeBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeBase.h"

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
    [NSException raise:@"ModeBase::initMode" format:@"ModeBase::initMode should be override in each mode."];
}

-(void)initMeasurement
{
    [NSException raise:@"ModeBase::initMeasurement" format:@"ModeBase::initMeasurement should be override in each mode."];
}

@end
