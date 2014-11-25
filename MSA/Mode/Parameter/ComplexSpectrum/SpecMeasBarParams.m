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
        bp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:bp forKey:(NSString *)bp.key];
    }
    
    // Restart
    if([self.mbarParamDict objectForKey:@"Restart"] == nil)
    {
        ImmediateParameter *ip = [[ImmediateParameter alloc] init];
        ip.key = [[NSMutableString alloc] initWithString:@"Restart"];
        [self.mbarParamDict setValue:ip forKey:(NSString *)ip.key];
    }

    // Pause/Resume
    if([self.mbarParamDict objectForKey:@"Pause/Resume"] == nil)
    {
        ImmediateParameter *ip = [[ImmediateParameter alloc] init];
        ip.key = [[NSMutableString alloc] initWithString:@"Pause/Resume"];
        [self.mbarParamDict setValue:ip forKey:(NSString *)ip.key];
    }
}

-(void)addBar1Parameters
{
    // Select Inport
    if([self.mbarParamDict objectForKey:@"Input Port"] == nil)
    {
        EnumMemberInfo *emiRF = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"RF" displayShort:@"RF"];
        EnumMemberInfo *emiEM = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"External Mixer" displayShort:@"EXT MIXER"];
        EnumMemberInfo *emiIQ = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"I/Q" displayShort:@"I/Q"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiRF];
        [emiArray addObject:emiEM];
        [emiArray addObject:emiIQ];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"Input Port"];
        ep.label = [[NSMutableString alloc] initWithString:@"Select Input"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Input"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
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
