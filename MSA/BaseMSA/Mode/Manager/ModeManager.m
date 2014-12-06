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
#import "ShareSettings.h"

@interface ModeManager()

@end

@implementation ModeManager

-(instancetype)init
{
    [NSException raise:@"ModeManager::init" format:@"Call ModeManager::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
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

-(MeasureBase *)prevMeasure
{
    return _mode.prevMeasure;
}

-(MeasureBase *)curMeasure
{
    return _mode.curMeasure;
}

-(MeasureBarDetail *)curMBarDetail
{
    return _mode.curMeasure.mbarDetail;
}

@end
