//
//  ViewBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBase.h"

@interface ViewBase()

@end

@implementation ViewBase

-(id)init
{
    [NSException raise:@"ViewBase::init" format:@"Call ViewBase::initWithConfig: instead"];
    
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
