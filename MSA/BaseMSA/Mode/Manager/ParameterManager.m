//
//  ParameterManager.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParameterManager.h"
#import "ModeParams.h"

@interface ParameterManager()

@end

@implementation ParameterManager

-(id) init {
    if ((self = [super init]))
    {
        self.modePars = [[ModeParams alloc] init];
    }
    
    return self;
}

-(void) registerParameterChangedEvent {
    [self.modePars registerParameterEvent];
}

-(void) unregisterParameterChangedEvent {
    [self.modePars unregisterParameterEvent];
}

-(void)setShareSettings:(ShareSettings *)shareSettings
{
    _shareSettings=shareSettings;
    self.modePars.shareSettings=shareSettings;
}

-(void)parseParameter
{
    [self.modePars parseParameter];
}

@end
