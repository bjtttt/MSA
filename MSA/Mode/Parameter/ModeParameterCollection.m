//
//  ModeParameterCollection.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeParameterCollection.h"
#import "SpecParameterCollection.h"
#import "WaveParameterCollection.h"

@interface ModeParameterCollection()

@end

@implementation ModeParameterCollection

+ (id)parameterCollection
{
    static id parCollection = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        parCollection = [[self alloc] init];
    });
    
    return parCollection;
}

-(id) init {
    if ((self = [super init]))
    {
        self.specParCol = [[SpecParameterCollection alloc] init];
        self.waveParCol = [[WaveParameterCollection alloc] init];
    }
    
    return self;
}

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    _shareSettings=shareSettings;
    self.specParCol.shareSettings=shareSettings;
    self.waveParCol.shareSettings=shareSettings;
}

-(void)registerParameterEvent
{
    [self.specParCol registerParameterEvent];
    [self.waveParCol registerParameterEvent];
}

-(void)unregisterParameterEvent
{
    [self.specParCol unregisterParameterEvent];
    [self.waveParCol unregisterParameterEvent];
}

@end
