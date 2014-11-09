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
#import "MeasureBarParameterCollection.h"

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
        self.mbarParCol = [[MeasureBarParameterCollection alloc] init];
    }
    
    return self;
}

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    _shareSettings=shareSettings;
    self.specParCol.shareSettings=shareSettings;
    self.waveParCol.shareSettings=shareSettings;
    self.mbarParCol.shareSettings=shareSettings;
}

-(void)registerParameterEvent
{
    [self.specParCol registerParameterEvent];
    [self.waveParCol registerParameterEvent];
    [self.mbarParCol registerParameterEvent];
}

-(void)unregisterParameterEvent
{
    [self.specParCol unregisterParameterEvent];
    [self.waveParCol unregisterParameterEvent];
    [self.mbarParCol unregisterParameterEvent];
}

-(void)parseParameter
{
    [self.specParCol parseParameter];
    [self.waveParCol parseParameter];
    [self.mbarParCol parseParameter];
}

@end
