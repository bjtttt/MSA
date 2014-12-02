//
//  ModeManager.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeManager.h"
#import "Mode.h"
#import "ModeBase.h"

@interface ModeManager()

@end

@implementation ModeManager

-(id) init {
    if ((self = [super init]))
    {
        self.mode = [[Mode alloc] init];
    }
    
    return self;
}

-(void)initMode
{
    _mode = [[Mode alloc] init];
    [_mode initMode];
    [_mode initMeasurement];
}

-(MeasureBase *)measure
{
    return _mode.curMeasure;
}

@end
