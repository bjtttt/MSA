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

-(id) init {
    if ((self = [super init]))
    {
        self.measureName = [[NSMutableString alloc] initWithString:@"ComplexSpectrum"];
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
    UISoftPanel *uiSP = [[UISoftPanel alloc] init];
    uiSP.shareSettings = self.shareSettings;
    uiSP.title = [@"Measure Bar 0" mutableCopy];
    
    UISoftKey *uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Continuous Mode"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_IMM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Restart"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_IMM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Pause/Resume"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar1Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] init];
    uiSP.shareSettings = self.shareSettings;
    uiSP.title = [@"Measure Bar 1" mutableCopy];
    
    UISoftKey *uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Input Port"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Input Coupling"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"ExtGainPreampDb"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar2Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] init];
    uiSP.shareSettings = self.shareSettings;
    uiSP.title = [@"Measure Bar 2" mutableCopy];
    
    UISoftKey *uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"InputZCorrection"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];

    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"AmpcorSelected"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"AmpcorState"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"ReferenceOscillatorUI"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Auto Align Type"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Auto Align Mode"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar3Menu
{
    UISoftPanel *uiSP = [[UISoftPanel alloc] init];
    uiSP.shareSettings = self.shareSettings;
    uiSP.title = [@"Measure Bar 3" mutableCopy];
    
    UISoftKey *uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"TotalAtten"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_VALUE;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"MechanicalAtten"];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
  
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_VALUE_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Electrical Atten"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"Electrical Atten State"];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_ENUM_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Internal Preamp Band"];
    uiSK.connectSubBoolean = (BooleanParameter *)[self.measParDict getParameterBy:@"Internal Preamp Band"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    [uiSK initSoftKeySubBoolean];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"AmpcorState"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"ReferenceOscillatorUI"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_ENUM;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Auto Align Type"];
    [uiSK initSoftKeyEnum];
    [uiSK expandEnumSoftPanel];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    uiSK = [[UISoftKey alloc] init];
    uiSK.softKeyType = KEY_BOOL;
    uiSK.shareSettings = self.shareSettings;
    uiSK.connectParam = [self.measParDict getParameterBy:@"Auto Align Mode"];
    [uiSK initSoftKeyEnum];
    uiSK.softPanel = uiSP;
    [uiSP addSoftKey:uiSK];
    
    return uiSP;
}

-(UISoftPanel *)setupMeasureBar4Menu
{
}

-(UISoftPanel *)setupMeasureBar5Menu
{
}

-(UISoftPanel *)setupMeasureBar6Menu
{
}

-(UISoftPanel *)setupMeasureBar7Menu
{
}

-(UISoftPanel *)setupMeasureBar8Menu
{
}

-(UISoftPanel *)setupMeasureBar9Menu
{
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
