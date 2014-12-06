//
//  ImmediateParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImmediateParameter.h"

@interface ImmediateParameter()

@end

@implementation ImmediateParameter

-(instancetype)init
{
    [NSException raise:@"ImmediateParameter::init" format:@"Call ImmediateParameter::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_IMM;
        _immedaiteAction = @selector(immediateActionHandler:);
    }
    
    return self;
}

-(void)immediateActionHandler:(Parameter *)param
{
    [self.shareSettings performSelector:@selector(valueTouching:) withObject:param];
}

@end
