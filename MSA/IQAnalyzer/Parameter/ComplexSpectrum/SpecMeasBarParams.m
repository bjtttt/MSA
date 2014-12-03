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
#import "MeasureBarDetail.h"
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

-(id)init
{
    [NSException raise:@"SpecMeasBarParams::init" format:@"Call SpecMeasBarParams::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
    }
    
    return self;
}

-(void)parseBar0Parameters
{
    // Sweep/Measure
    if([self getParameterBy:@"Continuous Mode"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] initWithConfig:self.shareSettings];
        bp.key = [[NSMutableString alloc] initWithString:@"Continuous Mode"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"Continous"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"Single"];
        bp.label = [[NSMutableString alloc] initWithString:@"Sweep/Measure"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:bp forKey:(NSString *)bp.key];
    }
    
    // Restart
    if([self getParameterBy:@"Restart"] == nil)
    {
        ImmediateParameter *ip = [[ImmediateParameter alloc] initWithConfig:self.shareSettings];
        ip.key = [[NSMutableString alloc] initWithString:@"Restart"];
        [self addParameter:ip forKey:(NSString *)ip.key];
    }

    // Pause/Resume
    if([self getParameterBy:@"Pause/Resume"] == nil)
    {
        ImmediateParameter *ip = [[ImmediateParameter alloc] initWithConfig:self.shareSettings];
        ip.key = [[NSMutableString alloc] initWithString:@"Pause/Resume"];
        [self addParameter:ip forKey:(NSString *)ip.key];
    }
}

-(void)parseBar1Parameters
{
    // Select Inport
    if([self getParameterBy:@"Input Port"] == nil)
    {
        EnumMemberInfo *emiRF = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"RF" displayShort:@"RF"];
        EnumMemberInfo *emiEM = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"External Mixer" displayShort:@"EXT MIXER"];
        EnumMemberInfo *emiIQ = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"I/Q" displayShort:@"I/Q"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiRF];
        [emiArray addObject:emiEM];
        [emiArray addObject:emiIQ];
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"Input Port" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Select Input"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Input"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    
    // RF Coupling
    if([self getParameterBy:@"Input Coupling"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] initWithConfig:self.shareSettings];
        bp.key = [[NSMutableString alloc] initWithString:@"Input Coupling"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"AC"];
        bp.yesLabelShort = [[NSMutableString alloc] initWithString:@"AC"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"DC"];
        bp.noLabelShort = [[NSMutableString alloc] initWithString:@"DC"];
        bp.label = [[NSMutableString alloc] initWithString:@"RF Coupling"];
        bp.labelShort = [[NSMutableString alloc] initWithString:@"Coupling"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:bp forKey:(NSString *)bp.key];
    }
    
    // RF Coupling
    if([self getParameterBy:@"ExtGainPreampDb"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] initWithConfig:self.shareSettings];
        rap.key = [[NSMutableString alloc] initWithString:@"ExtGainPreampDb"];
        rap.label = [[NSMutableString alloc] initWithString:@"External Gain"];
        rap.labelShort = [[NSMutableString alloc] initWithString:@"Ext Gain"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:rap forKey:(NSString *)rap.key];
    }
}

-(void)parseBar2Parameters
{
    // Input Z Correction
    if([self getParameterBy:@"InputZCorrection"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] initWithConfig:self.shareSettings];
        bp.key = [[NSMutableString alloc] initWithString:@"InputZCorrection"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"50 Ohm"];
        bp.yesLabelShort = [[NSMutableString alloc] initWithString:@"50 Ohm"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"75 Ohm"];
        bp.noLabelShort = [[NSMutableString alloc] initWithString:@"75 Ohm"];
        bp.label = [[NSMutableString alloc] initWithString:@"Input Z Correction"];
        bp.labelShort = [[NSMutableString alloc] initWithString:@"Input Z"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:bp forKey:(NSString *)bp.key];
    }
    
    // Select Correction
    if([self getParameterBy:@"AmpcorSelected"] == nil)
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
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"AmpcorSelected" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Select Correction"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }

    // Correction
    if([self getParameterBy:@"AmpcorState"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] initWithConfig:self.shareSettings];
        oop.key = [[NSMutableString alloc] initWithString:@"AmpcorState"];
        oop.label = [[NSMutableString alloc] initWithString:@"Correction"];
        oop.labelShort = [[NSMutableString alloc] initWithString:@"Correction"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:oop forKey:(NSString *)oop.key];
    }
    
    // Freq Ref Input
    if([self getParameterBy:@"ReferenceOscillatorUI"] == nil)
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
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"ReferenceOscillatorUI" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Freq Ref Input"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Freq Ref"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    
    // Auto Align
    if([self getParameterBy:@"Auto Align Type"] == nil)
    {
        EnumMemberInfo *emiOn = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Normal" displayShort:@"On"];
        EnumMemberInfo *emiOff = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Off" displayShort:@"Off"];
        EnumMemberInfo *emiPartial = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"Partial" displayShort:@"Partial"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiOn];
        [emiArray addObject:emiOff];
        [emiArray addObject:emiPartial];
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"Auto Align Type" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Auto Align"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Align"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    
    // All but RF
    if([self getParameterBy:@"Auto Align Mode"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] initWithConfig:self.shareSettings];
        oop.key = [[NSMutableString alloc] initWithString:@"Auto Align Mode"];
        oop.label = [[NSMutableString alloc] initWithString:@"All but RF"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:oop forKey:(NSString *)oop.key];
    }
}

-(void)parseBar3Parameters
{
    // Total Atten
    if([self getParameterBy:@"TotalAtten"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] initWithConfig:self.shareSettings];
        rap.key = [[NSMutableString alloc] initWithString:@"TotalAtten"];
        rap.labelShort = [[NSMutableString alloc] initWithString:@"Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:rap forKey:(NSString *)rap.key];
    }

    // Mech Atten
    if([self getParameterBy:@"MechanicalAtten"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] initWithConfig:self.shareSettings];
        rap.key = [[NSMutableString alloc] initWithString:@"MechanicalAtten"];
        rap.label = [[NSMutableString alloc] initWithString:@"Mech Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:rap forKey:(NSString *)rap.key];
    }

    // Elec Atten
    if([self getParameterBy:@"Electrical Atten"] == nil)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] initWithConfig:self.shareSettings];
        rap.key = [[NSMutableString alloc] initWithString:@"Electrical Atten"];
        rap.label = [[NSMutableString alloc] initWithString:@"Elec Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:rap forKey:(NSString *)rap.key];
    }
    // Elec Atten State
    if([self getParameterBy:@"InputZCorrection"] == nil)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] initWithConfig:self.shareSettings];
        bp.key = [[NSMutableString alloc] initWithString:@"Electrical Atten State"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"Enable"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"Disable"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:bp forKey:(NSString *)bp.key];
    }

    // Internal Preamp
    if([self getParameterBy:@"Internal Preamp Band"] == nil)
    {
        EnumMemberInfo *emiLow = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Low Band (3.60 GHz)" displayShort:@"Low"];
        EnumMemberInfo *emiFull = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Full Band (26.5 GHz)" displayShort:@"Full"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiLow];
        [emiArray addObject:emiFull];
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"Internal Preamp Band" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Internal Preamp"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Int Preamp"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    // Internal Preamp State
    if([self getParameterBy:@"Internal Preamp"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] initWithConfig:self.shareSettings];
        oop.key = [[NSMutableString alloc] initWithString:@"Internal Preamp"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:oop forKey:(NSString *)oop.key];
    }

    // uW Path Control
    if([self getParameterBy:@"Microwave Path Control"] == nil)
    {
        EnumMemberInfo *emi1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Standard Path" displayShort:@"Not Enabled"];
        EnumMemberInfo *emi2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Low Noise Path Enable" displayShort:@"Enabled"];
        EnumMemberInfo *emi3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"uW Presel Bypass" displayShort:@"Not Enabled"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emi1];
        [emiArray addObject:emi2];
        [emiArray addObject:emi3];
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"Microwave Path Control" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"uW Path Control"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"LNP"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
}

-(void)parseBar4Parameters
{
    // Select Trig Source
    if([self getParameterBy:@"TriggerSource"] == nil)
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
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"TriggerSource" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Select Trig Source"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Trig"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    
    // Trig Delay
    if([self getParameterBy:@"Trigger Delay"] == nil)
    {
        TimeParameter *tp = [[TimeParameter alloc] initWithConfig:self.shareSettings];
        tp.key = [[NSMutableString alloc] initWithString:@"Trigger Delay"];
        tp.label = [[NSMutableString alloc] initWithString:@"Trig Delay"];
        tp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:tp forKey:(NSString *)tp.key];
    }
    // Trig Delay State
    if([self getParameterBy:@"Trigger Delay State"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] initWithConfig:self.shareSettings];
        oop.key = [[NSMutableString alloc] initWithString:@"Trigger Delay State"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:oop forKey:(NSString *)oop.key];
    }
}

-(void)parseBar5Parameters
{
    // Phase Noise Optimization
    if([self getParameterBy:@"Phase Noise Opt"] == nil)
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
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"Phase Noise Opt" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Phase Noise Optimization"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"PNO"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    // Phase Noise Optimization State
    if([self getParameterBy:@"Phase Noise Opt Auto"] == nil)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] initWithConfig:self.shareSettings];
        amp.key = [[NSMutableString alloc] initWithString:@"Phase Noise Opt Auto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:amp forKey:(NSString *)amp.key];
    }

    // IF Gain
    if([self getParameterBy:@"IfGainState"] == nil)
    {
        EnumMemberInfo *emiAuto = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 display:@"Autorange" displayShort:@"Autorange"];
        EnumMemberInfo *emiLow = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 display:@"Low Gain" displayShort:@"Low"];
        EnumMemberInfo *emiHigh = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 display:@"High Gain" displayShort:@"High"];
        NSMutableArray *emiArray = [[NSMutableArray alloc] init];
        [emiArray addObject:emiAuto];
        [emiArray addObject:emiLow];
        [emiArray addObject:emiHigh];
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"IfGainState" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"IF Gain"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"IF Gain"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    // IF Gain State
    if([self getParameterBy:@"IFGainAuto"] == nil)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] initWithConfig:self.shareSettings];
        amp.key = [[NSMutableString alloc] initWithString:@"IFGainAuto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:amp forKey:(NSString *)amp.key];
    }
}

-(void)parseBar6Parameters
{
    // Center Freq
    if([self getParameterBy:@"CenterFrequency"] == nil)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] initWithConfig:self.shareSettings];
        fp.key = [[NSMutableString alloc] initWithString:@"CenterFrequency"];
        fp.label = [[NSMutableString alloc] initWithString:@"Center Freq"];
        fp.labelShort = [[NSMutableString alloc] initWithString:@"Center Freq"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:fp forKey:(NSString *)fp.key];
    }
    
    // Avg Type
    if([self getParameterBy:@"Average Type"] == nil)
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
        EnumParameter *ep = [[EnumParameter alloc] initWithKey:@"Average Type" withEnumDefinition:emiArray withDefaultValue:0 withConfig:self.shareSettings];
        ep.label = [[NSMutableString alloc] initWithString:@"Avg Type"];
        ep.labelShort = [[NSMutableString alloc] initWithString:@"Avg Type"];
        ep.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:ep forKey:(NSString *)ep.key];
    }
    // Avg Type State
    if([self getParameterBy:@"Average Type Auto"] == nil)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] initWithConfig:self.shareSettings];
        amp.key = [[NSMutableString alloc] initWithString:@"Average Type Auto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:amp forKey:(NSString *)amp.key];
    }

    // Avg|Hold Counter
    if([self getParameterBy:@"Average Counter"] == nil)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] initWithConfig:self.shareSettings];
        fp.key = [[NSMutableString alloc] initWithString:@"Average Counter"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:fp forKey:(NSString *)fp.key];
    }

    // Avg|Hold Number
    if([self getParameterBy:@"Average Number"] == nil)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] initWithConfig:self.shareSettings];
        fp.key = [[NSMutableString alloc] initWithString:@"Average Number"];
        fp.label = [[NSMutableString alloc] initWithString:@"Avg|Hold Number"];
        fp.labelShort = [[NSMutableString alloc] initWithString:@"Avg|Hold"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:fp forKey:(NSString *)fp.key];
    }

    // Averaging
    if([self getParameterBy:@"Average State"] == nil)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] initWithConfig:self.shareSettings];
        oop.key = [[NSMutableString alloc] initWithString:@"Average State"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:oop forKey:(NSString *)oop.key];
    }
}

-(void)parseBar7Parameters
{
    
}

-(void)parseBar8Parameters
{
    
}

-(void)parseBar9Parameters
{
    
}

@end
