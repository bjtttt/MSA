//
//  SpecMeasurement.m
//  MSA
//
//  Created by GUO Zhitao on 28/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecMeasurement.h"
#import "UISoftMenu.h"
#import "UISoftPanel.h"
#import "UISoftKey.h"
#import "UISoftKeyEnum.h"
#import "UISoftKeyEnumItem.h"
#import "MeasureBarDetail.h"
#import "MeasParamDictBase.h"
#import "Parameter.h"

@interface SpecMeasurement()

@end

@implementation SpecMeasurement

-(id)init
{
    [NSException raise:@"SpecMeasurement::init" format:@"Call SpecMeasurement::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if ((self = [super initWithConfig:ss]))
    {
        self.measureName = @"ComplexSpectrum";
    }
    
    return self;
}

-(void)initMeasureMent
{
    [super initMeasureMent];
}

-(void)initMeasureBarMenu
{
    [super initMeasureBarMenu];
}

-(UISoftPanel *)setupMeasureBar0Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:self.shareSettings];
    uiSP.title = @"Measure Bar 0";
    
    UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Continuous Mode"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_IMM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Restart"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_IMM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Pause/Resume"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar1Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:self.shareSettings];
    uiSP.title = @"Measure Bar 1";
    
    UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Input Port"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Input Coupling"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.connectParam = [self.measParDict getParameterBy:@"ExtGainPreampDb"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar2Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:self.shareSettings];
    uiSP.title = @"Measure Bar 2";
    
    UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"InputZCorrection"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];

    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"AmpcorSelected"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"AmpcorState"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"ReferenceOscillatorUI"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Auto Align Type"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Auto Align Mode"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar3Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:self.shareSettings];
    uiSP.title = @"Measure Bar 3";
    
    UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.connectParam = [self.measParDict getParameterBy:@"TotalAtten"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.connectParam = [self.measParDict getParameterBy:@"MechanicalAtten"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
  
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Electrical Atten"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"Electrical Atten State"];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Internal Preamp Band"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"Internal Preamp"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Microwave Path Control"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar4Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:self.shareSettings];
    uiSP.title = @"Measure Bar 4";

    UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.connectParam = [self.measParDict getParameterBy:@"TriggerSource"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Trigger Delay"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"Trigger Delay State"];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];

    return uiSP;
}

-(UISoftPanel *)setupMeasureBar5Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:self.shareSettings];
    uiSP.title = @"Measure Bar 5";
    
    UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Phase Noise Opt"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"Phase Noise Opt Auto"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];

    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"IfGainState"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"IFGainAuto"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar6Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:self.shareSettings];
    uiSP.title = @"Measure Bar 6";
    
    UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.connectParam = [self.measParDict getParameterBy:@"CenterFrequency"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];

    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_ENUM_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Average Type"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"Average Type Auto"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    /*
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Average Counter"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
     */
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Average Number"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] initWithConfig:self.shareSettings];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Average State"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar7Menu
{
    return nil;
}

-(UISoftPanel *)setupMeasureBar8Menu
{
    return nil;
}

-(UISoftPanel *)setupMeasureBar9Menu
{
    return nil;
}

-(void)initMeasureSoftMenu
{
}

-(void)initMeasureView
{
}

-(void)initMeasBarDetail
{
    self.mbarDetail = [[MeasureBarDetail alloc] init];
    self.mbarDetail.useRatio = true;
    self.mbarDetail.mbarCount = 7;
    self.mbarDetail.mbarWidths = [@[@1.0, @1.0, @1.0, @1.0, @1.0, @1.0, @2.0] mutableCopy];
    self.mbarDetail.mbarSmallWidths = [@[@1.0, @1.0, @1.0, @1.0, @1.0, @1.0, @2.0] mutableCopy];
    self.mbarDetail.totalWidth = 8.0f;
    self.mbarDetail.totalSmallWidth = 8.0f;
    self.mbarDetail.popupMenuHeights = [@[@200.0, @200.0, @200.0, @200.0, @200.0, @200.0, @200.0] mutableCopy];
    self.mbarDetail.popupMenuWidths = [@[@150.0, @150.0, @150.0, @150.0, @150.0, @150.0, @150.0] mutableCopy];
}

@end
