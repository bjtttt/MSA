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
    self.mode = [[Mode alloc] init];
    [self.mode initMode];
    [self.mode initMeasurement];
}

@end
