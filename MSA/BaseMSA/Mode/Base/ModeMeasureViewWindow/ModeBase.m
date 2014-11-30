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

-(id) init {
    if ((self = [super init]))
    {
        self.measureDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void)switchMeasurement:(MeasureBase *)curMeas
{
    NSAssert(YES==NO, @"ModeBase::switchMeasure should be override in each mode.");
}

-(void)initMode
{
    NSAssert(YES==NO, @"ModeBase::initMode should be override in each mode.");
}

-(void)initMeasureMent
{
    NSAssert(YES==NO, @"ModeBase::initMeasureMent should be override in each mode.");
}

@end
