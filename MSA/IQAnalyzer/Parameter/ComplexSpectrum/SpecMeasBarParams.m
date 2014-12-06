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

-(instancetype)init
{
    [NSException raise:@"SpecMeasBarParams::init" format:@"Call SpecMeasBarParams::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
    }
    
    return self;
}

-(void)parseBar0Parameters
{
    // Sweep/Measure
    if([self checkParameterBy:@"Continuous Mode"] == NO)
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
    if([self checkParameterBy:@"Restart"] == NO)
    {
        ImmediateParameter *ip = [[ImmediateParameter alloc] initWithConfig:self.shareSettings];
        ip.key = [[NSMutableString alloc] initWithString:@"Restart"];
        [self addParameter:ip forKey:(NSString *)ip.key];
    }

    // Pause/Resume
    if([self checkParameterBy:@"Pause/Resume"] == NO)
    {
        ImmediateParameter *ip = [[ImmediateParameter alloc] initWithConfig:self.shareSettings];
        ip.key = [[NSMutableString alloc] initWithString:@"Pause/Resume"];
        [self addParameter:ip forKey:(NSString *)ip.key];
    }
}

-(void)parseBar1Parameters
{
    // Select Inport
    if([self checkParameterBy:@"Input Port"] == NO)
    {
        EnumMemberInfo *emiRF = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"RF" withLabelShort:@"RF"];
        EnumMemberInfo *emiEM = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"External Mixer" withLabelShort:@"EXT MIXER"];
        EnumMemberInfo *emiIQ = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"I/Q" withLabelShort:@"I/Q"];
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
    if([self checkParameterBy:@"Input Coupling"] == NO)
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
    if([self checkParameterBy:@"ExtGainPreampDb"] == NO)
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
    if([self checkParameterBy:@"InputZCorrection"] == NO)
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
    if([self checkParameterBy:@"AmpcorSelected"] == NO)
    {
        EnumMemberInfo *emiC1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Correction 1" withLabelShort:@""];
        EnumMemberInfo *emiC2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Correction 2" withLabelShort:@""];
        EnumMemberInfo *emiC3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"Correction 3" withLabelShort:@""];
        EnumMemberInfo *emiC4 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 withLabel:@"Correction 4" withLabelShort:@""];
        EnumMemberInfo *emiC5 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 withLabel:@"Correction 5" withLabelShort:@""];
        EnumMemberInfo *emiC6 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:5 withLabel:@"Correction 6" withLabelShort:@""];
        EnumMemberInfo *emiC7 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:6 withLabel:@"Correction 7" withLabelShort:@""];
        EnumMemberInfo *emiC8 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:7 withLabel:@"Correction 8" withLabelShort:@""];
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
    if([self checkParameterBy:@"AmpcorState"] == NO)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] initWithConfig:self.shareSettings];
        oop.key = [[NSMutableString alloc] initWithString:@"AmpcorState"];
        oop.label = [[NSMutableString alloc] initWithString:@"Correction"];
        oop.labelShort = [[NSMutableString alloc] initWithString:@"Correction"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:oop forKey:(NSString *)oop.key];
    }
    
    // Freq Ref Input
    if([self checkParameterBy:@"ReferenceOscillatorUI"] == NO)
    {
        EnumMemberInfo *emiInt = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Internal" withLabelShort:@"Internal"];
        EnumMemberInfo *emiExt = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"External" withLabelShort:@"External"];
        EnumMemberInfo *emiSense = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"Sense" withLabelShort:@"Sense, Int"];
        EnumMemberInfo *emiPulse = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 withLabel:@"Pulse" withLabelShort:@"Pulse"];
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
    if([self checkParameterBy:@"Auto Align Type"] == NO)
    {
        EnumMemberInfo *emiOn = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Normal" withLabelShort:@"On"];
        EnumMemberInfo *emiOff = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Off" withLabelShort:@"Off"];
        EnumMemberInfo *emiPartial = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"Partial" withLabelShort:@"Partial"];
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
    if([self checkParameterBy:@"Auto Align Mode"] == NO)
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
    if([self checkParameterBy:@"TotalAtten"] == NO)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] initWithConfig:self.shareSettings];
        rap.key = [[NSMutableString alloc] initWithString:@"TotalAtten"];
        rap.labelShort = [[NSMutableString alloc] initWithString:@"Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:rap forKey:(NSString *)rap.key];
    }

    // Mech Atten
    if([self checkParameterBy:@"MechanicalAtten"] == NO)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] initWithConfig:self.shareSettings];
        rap.key = [[NSMutableString alloc] initWithString:@"MechanicalAtten"];
        rap.label = [[NSMutableString alloc] initWithString:@"Mech Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:rap forKey:(NSString *)rap.key];
    }

    // Elec Atten
    if([self checkParameterBy:@"Electrical Atten"] == NO)
    {
        RelativeAmplitudeParameter *rap = [[RelativeAmplitudeParameter alloc] initWithConfig:self.shareSettings];
        rap.key = [[NSMutableString alloc] initWithString:@"Electrical Atten"];
        rap.label = [[NSMutableString alloc] initWithString:@"Elec Atten"];
        rap.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:rap forKey:(NSString *)rap.key];
    }
    // Elec Atten State
    if([self checkParameterBy:@"Electrical Atten State"] == NO)
    {
        BooleanParameter *bp = [[BooleanParameter alloc] initWithConfig:self.shareSettings];
        bp.key = [[NSMutableString alloc] initWithString:@"Electrical Atten State"];
        bp.yesLabel = [[NSMutableString alloc] initWithString:@"Enable"];
        bp.noLabel = [[NSMutableString alloc] initWithString:@"Disable"];
        bp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:bp forKey:(NSString *)bp.key];
    }

    // Internal Preamp
    if([self checkParameterBy:@"Internal Preamp Band"] == NO)
    {
        EnumMemberInfo *emiLow = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Low Band (3.60 GHz)" withLabelShort:@"Low"];
        EnumMemberInfo *emiFull = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Full Band (26.5 GHz)" withLabelShort:@"Full"];
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
    if([self checkParameterBy:@"Internal Preamp"] == NO)
    {
        OnOffParameter *oop = [[OnOffParameter alloc] initWithConfig:self.shareSettings];
        oop.key = [[NSMutableString alloc] initWithString:@"Internal Preamp"];
        oop.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:oop forKey:(NSString *)oop.key];
    }

    // uW Path Control
    if([self checkParameterBy:@"Microwave Path Control"] == NO)
    {
        EnumMemberInfo *emi1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Standard Path" withLabelShort:@"Not Enabled"];
        EnumMemberInfo *emi2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Low Noise Path Enable" withLabelShort:@"Enabled"];
        EnumMemberInfo *emi3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"uW Presel Bypass" withLabelShort:@"Not Enabled"];
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
    if([self checkParameterBy:@"TriggerSource"] == NO)
    {
        EnumMemberInfo *emiFree = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Free Run" withLabelShort:@"Free Run"];
        EnumMemberInfo *emiVideo = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Video" withLabelShort:@"Vedio"];
        EnumMemberInfo *emiLine = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"Line" withLabelShort:@"Line"];
        EnumMemberInfo *emiExt1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 withLabel:@"External 1" withLabelShort:@"External 1"];
        EnumMemberInfo *emiExt2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 withLabel:@"External 2" withLabelShort:@"External 2"];
        EnumMemberInfo *emiRFB = [[EnumMemberInfo alloc] initWithEnumMemberInfo:5 withLabel:@"RF Burst" withLabelShort:@"RF Burst"];
        EnumMemberInfo *emiPer = [[EnumMemberInfo alloc] initWithEnumMemberInfo:6 withLabel:@"Periodic" withLabelShort:@"Periodic"];
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
    if([self checkParameterBy:@"Trigger Delay"] == NO)
    {
        TimeParameter *tp = [[TimeParameter alloc] initWithConfig:self.shareSettings];
        tp.key = [[NSMutableString alloc] initWithString:@"Trigger Delay"];
        tp.label = [[NSMutableString alloc] initWithString:@"Trig Delay"];
        tp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:tp forKey:(NSString *)tp.key];
    }
    // Trig Delay State
    if([self checkParameterBy:@"Trigger Delay State"] == NO)
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
    if([self checkParameterBy:@"Phase Noise Opt"] == NO)
    {
        EnumMemberInfo *emi1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Best Close-In ~ Noise [offset < 690 kHz]" withLabelShort:@"Close"];
        EnumMemberInfo *emi2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Balance Noise and Spurs [offset < 690 kHz]" withLabelShort:@"Balanced"];
        EnumMemberInfo *emi3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"Best Spurs [offset < 690 kHz]" withLabelShort:@"Best Spurs"];
        EnumMemberInfo *emi4 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 withLabel:@"Best Wide-Offset ~ Noise [offset > 710 kHz]" withLabelShort:@"Wide"];
        EnumMemberInfo *emi5 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 withLabel:@"Fast Tuning" withLabelShort:@"Fast"];
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
    if([self checkParameterBy:@"Phase Noise Opt Auto"] == NO)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] initWithConfig:self.shareSettings];
        amp.key = [[NSMutableString alloc] initWithString:@"Phase Noise Opt Auto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:amp forKey:(NSString *)amp.key];
    }

    // IF Gain
    if([self checkParameterBy:@"IfGainState"] == NO)
    {
        EnumMemberInfo *emiAuto = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Autorange" withLabelShort:@"Autorange"];
        EnumMemberInfo *emiLow = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Low Gain" withLabelShort:@"Low"];
        EnumMemberInfo *emiHigh = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"High Gain" withLabelShort:@"High"];
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
    if([self checkParameterBy:@"IFGainAuto"] == NO)
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
    if([self checkParameterBy:@"CenterFrequency"] == NO)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] initWithConfig:self.shareSettings];
        fp.key = [[NSMutableString alloc] initWithString:@"CenterFrequency"];
        fp.label = [[NSMutableString alloc] initWithString:@"Center Freq"];
        fp.labelShort = [[NSMutableString alloc] initWithString:@"Center Freq"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:fp forKey:(NSString *)fp.key];
    }
    
    // Avg Type
    if([self checkParameterBy:@"Average Type"] == NO)
    {
        EnumMemberInfo *emi1 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:0 withLabel:@"Pwr Avg (RMS)" withLabelShort:@"Pwr Avg"];
        EnumMemberInfo *emi2 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:1 withLabel:@"Log-Pwr Avg (Video)" withLabelShort:@"Log-Pwr Avg (Video)"];
        EnumMemberInfo *emi3 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:2 withLabel:@"Voltage Avg" withLabelShort:@"Voltage Avg"];
        EnumMemberInfo *emi4 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:3 withLabel:@"Maximum" withLabelShort:@"Voltage AvgMaximum"];
        EnumMemberInfo *emi5 = [[EnumMemberInfo alloc] initWithEnumMemberInfo:4 withLabel:@"Minimum" withLabelShort:@"Minimum"];
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
    if([self checkParameterBy:@"Average Type Auto"] == NO)
    {
        AutoManParameter *amp = [[AutoManParameter alloc] initWithConfig:self.shareSettings];
        amp.key = [[NSMutableString alloc] initWithString:@"Average Type Auto"];
        amp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:amp forKey:(NSString *)amp.key];
    }

    // Avg|Hold Counter
    if([self checkParameterBy:@"Average Counter"] == NO)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] initWithConfig:self.shareSettings];
        fp.key = [[NSMutableString alloc] initWithString:@"Average Counter"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:fp forKey:(NSString *)fp.key];
    }

    // Avg|Hold Number
    if([self checkParameterBy:@"Average Number"] == NO)
    {
        FrequencyParameter *fp = [[FrequencyParameter alloc] initWithConfig:self.shareSettings];
        fp.key = [[NSMutableString alloc] initWithString:@"Average Number"];
        fp.label = [[NSMutableString alloc] initWithString:@"Avg|Hold Number"];
        fp.labelShort = [[NSMutableString alloc] initWithString:@"Avg|Hold"];
        fp.valueChanged = @selector(valueChangedHandler:);
        [self addParameter:fp forKey:(NSString *)fp.key];
    }

    // Averaging
    if([self checkParameterBy:@"Average State"] == NO)
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
