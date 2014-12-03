//
//  ModeParams.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeParams.h"
#import "SpecParams.h"
#import "WaveParams.h"
#import "ModeParamDictBase.h"

@interface ModeParams()

@end

@implementation ModeParams

-(id)init
{
    [NSException raise:@"ModeParams::init" format:@"Call ModeParams::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
        _specParams = [[SpecParams alloc] initWithConfig:ss];
        _specParams.modePar = self;
        [self addMeasurePar:_specParams forKey:@"ComplexSpectrum"];
        
        _waveParams = [[WaveParams alloc] initWithConfig:ss];
        _waveParams.modePar = self;
        [self addMeasurePar:_waveParams forKey:@"IQWaveform"];
    }
    
    return self;
}

-(void)registerParameterEvent
{
    [self.specParams registerParameterEvent];
    [self.waveParams registerParameterEvent];
}

-(void)unregisterParameterEvent
{
    [self.specParams unregisterParameterEvent];
    [self.waveParams unregisterParameterEvent];
}

-(void)parseParameter
{
    [self.specParams parseParameter];
    [self.waveParams parseParameter];
}

@end
