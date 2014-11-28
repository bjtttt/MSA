//
//  SpecParams.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecParams.h"
#import "SpecMeasBarParams.h"

@interface SpecParams()

@end

@implementation SpecParams

-(id) init {
    if ((self = [super init]))
    {
        self.specParamDict = [[NSMutableDictionary alloc] init];
        self.specMeasBarParams = [[SpecMeasBarParams alloc] init];
        self.specMeasBarParams.mbarParamDict = self.specParamDict;
    }
    
    return self;
}

-(void)registerParameterEvent
{
    
}

-(void)unregisterParameterEvent
{
    
}

-(void)parseParameter
{
    [self.specMeasBarParams parseParameter];
}

@end