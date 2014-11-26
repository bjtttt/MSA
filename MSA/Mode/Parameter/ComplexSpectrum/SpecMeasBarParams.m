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
    
    // RF Coupling
    if([self.mbarParamDict objectForKey:@"Input Coupling"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] init];
        bp.key = [[NSMutableString alloc] initWithString:@"Input Coupling"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"AC"];
        bp.yesLabelShort = [[NSMutableString alloc] initWithString:@"AC"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"DC"];
        bp.noLabelShort = [[NSMutableString alloc] initWithString:@"DC"];
        bp.label = [[NSMutableString alloc] initWithString:@"RF Coupling"];
        bp.labelShort = [[NSMutableString alloc] initWithString:@"Coupling"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:bp forKey:(NSString *)bp.key];
    }
    
    // RF Coupling
    if([self.mbarParamDict objectForKey:@"ExtGainPreampDb"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] init];
        rap.key = [[NSMutableString alloc] initWithString:@"ExtGainPreampDb"];
        rap.label = [[NSMutableString alloc] initWithString:@"External Gain"];
        rap.labelShort = [[NSMutableString alloc] initWithString:@"Ext Gain"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:rap forKey:(NSString *)rap.key];
    }
}

-(void)addBar2Parameters
{
    // Input Z Correction
    if([self.mbarParamDict objectForKey:@"InputZCorrection"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] init];
        bp.key = [[NSMutableString alloc] initWithString:@"InputZCorrection"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"50 Ohm"];
        bp.yesLabelShort = [[NSMutableString alloc] initWithString:@"50 Ohm"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"75 Ohm"];
        bp.noLabelShort = [[NSMutableString alloc] initWithString:@"75 Ohm"];
        bp.label = [[NSMutableString alloc] initWithString:@"Input Z Correction"];
        bp.labelShort = [[NSMutableString alloc] initWithString:@"Input Z"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:bp forKey:(NSString *)bp.key];
    }
    
    // Select Correction
    if([self.mbarParamDict objectForKey:@"AmpcorSelected"] == nil)
    {
        EnumMemberInfo *emiC1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Correction 1" displayShort:@""];
        EnumMemberInfo *emiC2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Correction 2" displayShort:@""];
        EnumMemberInfo *emiC3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"Correction 3" displayShort:@""];
        EnumMemberInfo *emiC4 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 display:@"Correction 4" displayShort:@""];
        EnumMemberInfo *emiC5 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 display:@"Correction 5" displayShort:@""];
        EnumMemberInfo *emiC6 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:5 display:@"Correction 6" displayShort:@""];
        EnumMemberInfo *emiC7 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:6 display:@"Correction 7" displayShort:@""];
        EnumMemberInfo *emiC8 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:7 display:@"Correction 8" displayShort:@""];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiC1];
        [emiArray addObject:emiC2];
        [emiArray addObject:emiC3];
        [emiArray addObject:emiC4];
        [emiArray addObject:emiC5];
        [emiArray addObject:emiC6];
        [emiArray addObject:emiC7];
        [emiArray addObject:emiC8];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"AmpcorSelected"];
        ep.label = [[NSMutableString alloc] initWithString:@"Select Correction"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }

    // Correction
    if([self.mbarParamDict objectForKey:@"AmpcorState"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] init];
        oop.key = [[NSMutableString alloc] initWithString:@"AmpcorState"];
        oop.label = [[NSMutableString alloc] initWithString:@"Correction"];
        oop.labelShort = [[NSMutableString alloc] initWithString:@"Correction"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:oop forKey:(NSString *)oop.key];
    }
    
    // Freq Ref Input
    if([self.mbarParamDict objectForKey:@"ReferenceOscillatorUI"] == nil)
    {
        EnumMemberInfo *emiInt = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Internal" displayShort:@"Internal"];
        EnumMemberInfo *emiExt = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"External" displayShort:@"External"];
        EnumMemberInfo *emiSense = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"Sense" displayShort:@"Sense, Int"];
        EnumMemberInfo *emiPulse = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 display:@"Pulse" displayShort:@"Pulse"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiInt];
        [emiArray addObject:emiExt];
        [emiArray addObject:emiSense];
        [emiArray addObject:emiPulse];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"ReferenceOscillatorUI"];
        ep.label = [[NSMutableString alloc] initWithString:@"Freq Ref Input"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Freq Ref"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
    
    // Auto Align
    if([self.mbarParamDict objectForKey:@"Auto Align Type"] == nil)
    {
        EnumMemberInfo *emiOn = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Normal" displayShort:@"On"];
        EnumMemberInfo *emiOff = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Off" displayShort:@"Off"];
        EnumMemberInfo *emiPartial = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"Partial" displayShort:@"Partial"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiOn];
        [emiArray addObject:emiOff];
        [emiArray addObject:emiPartial];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"Auto Align Type"];
        ep.label = [[NSMutableString alloc] initWithString:@"Auto Align"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Align"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
    
    // All but RF
    if([self.mbarParamDict objectForKey:@"Auto Align Mode"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] init];
        oop.key = [[NSMutableString alloc] initWithString:@"Auto Align Mode"];
        oop.label = [[NSMutableString alloc] initWithString:@"All but RF"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:oop forKey:(NSString *)oop.key];
    }
}

-(void)addBar3Parameters
{
    // Total Atten
    if([self.mbarParamDict objectForKey:@"TotalAtten"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] init];
        rap.key = [[NSMutableString alloc] initWithString:@"TotalAtten"];
        rap.labelShort = [[NSMutableString alloc] initWithString:@"Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:rap forKey:(NSString *)rap.key];
    }

    // Mech Atten
    if([self.mbarParamDict objectForKey:@"MechanicalAtten"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] init];
        rap.key = [[NSMutableString alloc] initWithString:@"MechanicalAtten"];
        rap.label = [[NSMutableString alloc] initWithString:@"Mech Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:rap forKey:(NSString *)rap.key];
    }

    // Elec Atten
    if([self.mbarParamDict objectForKey:@"Electrical Atten"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] init];
        rap.key = [[NSMutableString alloc] initWithString:@"Electrical Atten"];
        rap.label = [[NSMutableString alloc] initWithString:@"Elec Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:rap forKey:(NSString *)rap.key];
    }
    // Elec Atten State
    if([self.mbarParamDict objectForKey:@"InputZCorrection"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] init];
        bp.key = [[NSMutableString alloc] initWithString:@"Electrical Atten State"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"Enable"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"Disable"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:bp forKey:(NSString *)bp.key];
    }

    // Internal Preamp
    if([self.mbarParamDict objectForKey:@"Internal Preamp Band"] == nil)
    {
        EnumMemberInfo *emiLow = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Low Band (3.60 GHz)" displayShort:@"Low"];
        EnumMemberInfo *emiFull = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Full Band (26.5 GHz)" displayShort:@"Full"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiLow];
        [emiArray addObject:emiFull];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"Internal Preamp Band"];
        ep.label = [[NSMutableString alloc] initWithString:@"Internal Preamp"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Int Preamp"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
    // Internal Preamp State
    if([self.mbarParamDict objectForKey:@"Internal Preamp"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] init];
        oop.key = [[NSMutableString alloc] initWithString:@"Internal Preamp"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:oop forKey:(NSString *)oop.key];
    }

    // uW Path Control
    if([self.mbarParamDict objectForKey:@"Microwave Path Control"] == nil)
    {
        EnumMemberInfo *emi1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Standard Path" displayShort:@"Not Enabled"];
        EnumMemberInfo *emi2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Low Noise Path Enable" displayShort:@"Enabled"];
        EnumMemberInfo *emi3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"uW Presel Bypass" displayShort:@"Not Enabled"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emi1];
        [emiArray addObject:emi2];
        [emiArray addObject:emi3];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"Microwave Path Control"];
        ep.label = [[NSMutableString alloc] initWithString:@"uW Path Control"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"LNP"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
}

-(void)addBar4Parameters
{
    // Select Trig Source
    if([self.mbarParamDict objectForKey:@"TriggerSource"] == nil)
    {
        EnumMemberInfo *emiFree = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Free Run" displayShort:@"Free Run"];
        EnumMemberInfo *emiVideo = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Video" displayShort:@"Vedio"];
        EnumMemberInfo *emiLine = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"Line" displayShort:@"Line"];
        EnumMemberInfo *emiExt1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 display:@"External 1" displayShort:@"External 1"];
        EnumMemberInfo *emiExt2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 display:@"External 2" displayShort:@"External 2"];
        EnumMemberInfo *emiRFB = [[EnumMemberInfo alloc] initWithEnumMemberInfo:5 display:@"RF Burst" displayShort:@"RF Burst"];
        EnumMemberInfo *emiPer = [[EnumMemberInfo alloc] initWithEnumMemberInfo:6 display:@"Periodic" displayShort:@"Periodic"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiFree];
        [emiArray addObject:emiVideo];
        [emiArray addObject:emiLine];
        [emiArray addObject:emiExt1];
        [emiArray addObject:emiExt2];
        [emiArray addObject:emiRFB];
        [emiArray addObject:emiPer];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"TriggerSource"];
        ep.label = [[NSMutableString alloc] initWithString:@"Select Trig Source"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Trig"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
    
    // Trig Delay
    if([self.mbarParamDict objectForKey:@"Trigger Delay"] == nil)
    {
        TimeParameter *tp = [[TimeParameter alloc] init];
        tp.key = [[NSMutableString alloc] initWithString:@"Trigger Delay"];
        tp.label = [[NSMutableString alloc] initWithString:@"Trig Delay"];
        tp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:tp forKey:(NSString *)tp.key];
    }
    // Trig Delay State
    if([self.mbarParamDict objectForKey:@"Trigger Delay State"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] init];
        oop.key = [[NSMutableString alloc] initWithString:@"Trigger Delay State"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:oop forKey:(NSString *)oop.key];
    }
}

-(void)addBar5Parameters
{
    // Phase Noise Optimization
    if([self.mbarParamDict objectForKey:@"Phase Noise Opt"] == nil)
    {
        EnumMemberInfo *emi1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Best Close-In ~ Noise [offset < 690 kHz]" displayShort:@"Close"];
        EnumMemberInfo *emi2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Balance Noise and Spurs [offset < 690 kHz]" displayShort:@"Balanced"];
        EnumMemberInfo *emi3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"Best Spurs [offset < 690 kHz]" displayShort:@"Best Spurs"];
        EnumMemberInfo *emi4 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 display:@"Best Wide-Offset ~ Noise [offset > 710 kHz]" displayShort:@"Wide"];
        EnumMemberInfo *emi5 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 display:@"Fast Tuning" displayShort:@"Fast"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emi1];
        [emiArray addObject:emi2];
        [emiArray addObject:emi3];
        [emiArray addObject:emi4];
        [emiArray addObject:emi5];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"Phase Noise Opt"];
        ep.label = [[NSMutableString alloc] initWithString:@"Phase Noise Optimization"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"PNO"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
    // Phase Noise Optimization State
    if([self.mbarParamDict objectForKey:@"Phase Noise Opt Auto"] == nil)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] init];
        amp.key = [[NSMutableString alloc] initWithString:@"Phase Noise Opt Auto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:amp forKey:(NSString *)amp.key];
    }

    // IF Gain
    if([self.mbarParamDict objectForKey:@"IfGainState"] == nil)
    {
        EnumMemberInfo *emiAuto = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Autorange" displayShort:@"Autorange"];
        EnumMemberInfo *emiLow = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Low Gain" displayShort:@"Low"];
        EnumMemberInfo *emiHigh = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"High Gain" displayShort:@"High"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiAuto];
        [emiArray addObject:emiLow];
        [emiArray addObject:emiHigh];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"IfGainState"];
        ep.label = [[NSMutableString alloc] initWithString:@"IF Gain"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"IF Gain"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
    // IF Gain State
    if([self.mbarParamDict objectForKey:@"IFGainAuto"] == nil)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] init];
        amp.key = [[NSMutableString alloc] initWithString:@"IFGainAuto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:amp forKey:(NSString *)amp.key];
    }
}

-(void)addBar6Parameters
{
    // Center Freq
    if([self.mbarParamDict objectForKey:@"CenterFrequency"] == nil)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] init];
        fp.key = [[NSMutableString alloc] initWithString:@"CenterFrequency"];
        fp.label = [[NSMutableString alloc] initWithString:@"Center Freq"];
        fp.labelShort = [[NSMutableString alloc] initWithString:@"Center Freq"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:fp forKey:(NSString *)fp.key];
    }
    
    // Avg Type
    if([self.mbarParamDict objectForKey:@"Average Type"] == nil)
    {
        EnumMemberInfo *emi1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Pwr Avg (RMS)" displayShort:@"Pwr Avg"];
        EnumMemberInfo *emi2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Log-Pwr Avg (Video)" displayShort:@"Log-Pwr Avg (Video)"];
        EnumMemberInfo *emi3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"Voltage Avg" displayShort:@"Voltage Avg"];
        EnumMemberInfo *emi4 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 display:@"Maximum" displayShort:@"Voltage AvgMaximum"];
        EnumMemberInfo *emi5 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 display:@"Minimum" displayShort:@"Minimum"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emi1];
        [emiArray addObject:emi2];
        [emiArray addObject:emi3];
        [emiArray addObject:emi4];
        [emiArray addObject:emi5];
        EnumParameter *ep = [[EnumParameter alloc] initWithEnumDefinition:emiArray];
        ep.key = [[NSMutableString alloc] initWithString:@"Average Type"];
        ep.label = [[NSMutableString alloc] initWithString:@"Avg Type"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Avg Type"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:ep forKey:(NSString *)ep.key];
    }
    // Avg Type State
    if([self.mbarParamDict objectForKey:@"Average Type Auto"] == nil)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] init];
        amp.key = [[NSMutableString alloc] initWithString:@"Average Type Auto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:amp forKey:(NSString *)amp.key];
    }

    // Avg|Hold Counter
    if([self.mbarParamDict objectForKey:@"Average Counter"] == nil)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] init];
        fp.key = [[NSMutableString alloc] initWithString:@"Average Counter"];
       fp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:fp forKey:(NSString *)fp.key];
    }

    // Avg|Hold Number
    if([self.mbarParamDict objectForKey:@"Average Number"] == nil)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] init];
        fp.key = [[NSMutableString alloc] initWithString:@"Average Number"];
        fp.label = [[NSMutableString alloc] initWithString:@"Avg|Hold Number"];
        fp.labelShort = [[NSMutableString alloc] initWithString:@"Avg|Hold"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:fp forKey:(NSString *)fp.key];
    }

    // Averaging
    if([self.mbarParamDict objectForKey:@"Average State"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] init];
        oop.key = [[NSMutableString alloc] initWithString:@"Average State"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self.mbarParamDict setValue:oop forKey:(NSString *)oop.key];
    }
}

-(void)addBar7Parameters
{
    
}

@end
