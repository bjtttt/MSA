//
//  WindowBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WindowBase.h"

@interface WindowBase()

@end

@implementation WindowBase

-(id)init
{
    [NSException raise:@"WindowBase::init" format:@"Call WindowBase::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super init]))
    {
        _shareSettings = ss;
    }
    
    return self;
}

@end
