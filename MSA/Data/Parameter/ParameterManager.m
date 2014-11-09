//
//  ParameterManager.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParameterManager.h"
#import "ModeParameterCollection.h"

@interface ParameterManager()

@end

@implementation ParameterManager

+ (id)parameterManager
{
    static id parManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        parManager = [[self alloc] init];
    });
    
    return parManager;
}

-(id) init {
    if ((self = [super init]))
    {
        self.modeParCol = [ModeParameterCollection parameterCollection];
    }
    
    return self;
}

-(void) registerParameterChangedEvent {
    [self.modeParCol registerParameterEvent];
}

-(void) unregisterParameterChangedEvent {
    [self.modeParCol unregisterParameterEvent];
}

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    _shareSettings=shareSettings;
    self.modeParCol.shareSettings=shareSettings;
}

@end
