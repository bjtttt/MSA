//
//  SpecMeasBarParams.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecMeasBarParams.h"
#import "ShareSettings.h"
#import "EnumMemberInfo.h"
#import "EnumParameter.h"
#import "BooleanParameter.h"
#import "AutoManParameter.h"
#import "OnOffParameter.h"
#import "DoubleParameter.h"
#import "TimeParameter.h"
#import "AmplitudeParameter.h"
#import "FrequencyParameter.h"
#import "RelativeAmplitudeParameter.h"
#import "IntParameter.h"
#import "StringParameter.h"
#import "ImmediateParameter.h"
#import "Parameter.h"
#import "ParameterManager.h"

@interface SpecMeasBarParams()

@end

@implementation SpecMeasBarParams

-(id) init {
    if ((self = [super init]))
    {
    }
    
    return self;
}

-(void)addBar0Parameters
{
    // Sweep/Measure
    if([self.mbarParamDict objectForKey:@"Continuous Mode"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] init];
        bp.key = [[NSMutableString alloc] initWithString:@"Continuous Mode"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"Continous"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"Single"];
        bp.label = [[NSMutableString alloc] initWithString:@"Sweep/Measure"];
        bp.valueChanged = @selector(shareSettings.valueChanged:);
        [self.mbarParamDict setValue:bp forKey:(NSString *)bp.key];
    }
    
    // Restart
    if([self.mbarParamDict objectForKey:@"Restart"] == nil)
    {
        ImmediateParameter *ip = [[ImmediateParameter alloc] init];
        ip.key = [[NSMutableString alloc] initWithString:@"Restart"];
        [self.mbarParamDict setValue:ip forKey:(NSString *)ip.key];
    }
    
}

-(void)addBar1Parameters
{
    
}

-(void)addBar2Parameters
{
    
}

-(void)addBar3Parameters
{
    
}

-(void)addBar4Parameters
{
    
}

-(void)addBar5Parameters
{
    
}

-(void)addBar6Parameters
{
    
}

-(void)addBar7Parameters
{
    
}

@end
