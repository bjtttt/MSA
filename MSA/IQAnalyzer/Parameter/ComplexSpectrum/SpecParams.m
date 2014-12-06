//
//  SpecParams.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecParams.h"
#import "MeasParamDictBase.h"
#import "MeasBarParamDictBase.h"
#import "SpecMeasBarParams.h"

@interface SpecParams()

@end

@implementation SpecParams

-(instancetype)init
{
    [NSException raise:@"SpecParams::init" format:@"Call SpecParams::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
        self.mbarPar = [[SpecMeasBarParams alloc] initWithConfig:ss];
        self.mbarPar.parDict = self.parDict;
        self.mbarPar.measPar = self;
    }
    
    return self;
}

-(void)registerParameterEvent
{
    
}

-(void)unregisterParameterEvent
{
    
}

-(void)addMeasMenuParameters
{
}

-(void)addMeasOtherParameters
{
}

@end
