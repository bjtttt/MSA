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
#import "MeasureBase.h"
#import "MeasureBarDetail.h"

@interface ModeManager()

@end

@implementation ModeManager

-(id)init
{
    [NSException raise:@"ModeManager::init" format:@"Call ModeManager::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super init]))
    {
        _shareSettings = ss;
        _mode = [[Mode alloc] initWithConfig:ss];
    }
    
    return self;
}

-(void)initMode
{
    _mode = [[Mode alloc] initWithConfig:_shareSettings];
    [_mode initMode];
    [_mode initMeasurement];
}

-(MeasureBase *)measure
{
    return _mode.curMeasure;
}

-(MeasureBarDetail *)mbarDetail
{
    return _mode.curMeasure.mbarDetail;
}

@end
