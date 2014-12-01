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

@interface SpecParams()

@end

@implementation SpecParams

-(id) init {
    if ((self = [super init]))
    {
    }
    
    return self;
}

-(void)registerParameterEvent
{
    
}

-(void)unregisterParameterEvent
{
    
}

-(void)addMeasBarParameters
{
    [self.mbarPar parseParameter];
}

-(void)addMeasMenuParameters
{
}

-(void)addMeasOtherParameters
{
}

@end
