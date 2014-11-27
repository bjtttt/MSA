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

@interface ModeParams()

@end

@implementation ModeParams

-(id) init {
    if ((self = [super init]))
    {
        self.specParams = [[SpecParams alloc] init];
        self.waveParams = [[WaveParams alloc] init];
    }
    
    return self;
}

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    _shareSettings=shareSettings;
    self.specParams.shareSettings=shareSettings;
    self.waveParams.shareSettings=shareSettings;
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
