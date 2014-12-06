//
//  AutoManParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoManParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface AutoManParameter()

@end

@implementation AutoManParameter

-(instancetype)init
{
    [NSException raise:@"AutoManParameter::init" format:@"Call AutoManParameter::initWithConfig: instead"];
    
    return nil;
}

- (instancetype) initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_BOOL_AUTOMAN;
        self.yesLabel = @"Auto";
        self.yesLabelShort = @"Auto";
        self.noLabel = @"Man";
        self.noLabelShort = @"Man";
    }
    
    return self;
}

@end
