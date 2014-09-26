//
//  ShareSettings.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-27.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#ifndef SHARE_SETTINGS
#define SHARE_SETTINGS

#import <Foundation/Foundation.h>

//typedef enum msaLayout {
//    MSA_DISP,
//    MSA_MENU,
//    MSA_MEAS,
//} MSALayout;

typedef enum msgType {
    MSG_CURRENT_CONDITIONS,
    MSG_HISTORY,
    MSG_SETTINGS
}MSGType;

typedef enum systType {
    SYST_SYSTEM,
    SYST_IO_CONFIG,
    SYST_USER_INTERFACE,
    SYST_POWER_ON,
    SYST_RESTORE_DEF,
    SYST_ALIGN,
    SYST_LIC,
    SYST_SECURITY,
    SYST_DIAG,
    SYST_SERVICE,
    SYST_LANG
}SYSTType;

typedef enum instrumentStatus {
    INST_DISC,
    INST_INCONN,
    INST_CONN,
    INST_INDISC
}InstrumentStatus;

#define NORMAL_CORNER_RADIUS 5.0f
#define HEAVY_CORNER_RADIUS 10.0f
#define NORMAL_BORDER_WIDTH 1.0f
#define HEAVY_BORDER_WIDTH 2.0f
#define VC_MARGIN 1.0f
#define MENU_WIDTH 150.0f
#define MEAS_WIDTH 350.0f
#define MEAS_HEIGHT 600.0f
#define MEASBAR_HEIGHT 60.0f
#define NAVBAR_HEIGHT 44.0f
#define ADDINSTRUMENT_HEIGHT 75.0f

#define DEBUG_OUTPUT YES

@interface ShareSettings : NSObject

@property (nonatomic) BOOL menuTapped;
@property (nonatomic) BOOL measureTapped;

@property (nonatomic) BOOL menuDisplayed;
@property (nonatomic) BOOL measureDisplayed;

@property (nonatomic) InstrumentStatus currentInstrumentStatus;
@property (nonatomic) NSMutableString *currentInstrument;

@property (nonatomic) NSMutableArray *measureView;

+(id)sharedSettings;

- (void) initMeasureView;

@end

#endif
