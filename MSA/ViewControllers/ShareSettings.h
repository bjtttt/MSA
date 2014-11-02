//
//  ShareSettings.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-27.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#ifndef SHARE_SETTINGS
#define SHARE_SETTINGS

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//#import "MeasureBarContainerDefinition.h"

//typedef enum msaLayout {
//    MSA_DISP,
//    MSA_MENU,
//    MSA_MEAS,
//} MSALayout;

typedef enum msgType {
    MSG_CURRENT_CONDITIONS = 0,
    MSG_HISTORY,
    MSG_SETTINGS
}MSGType;

typedef enum systType {
    SYST_SYSTEM = 0,
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
    INST_DISC = 0,
    INST_INCONN,
    INST_CONN,
    INST_INDISC
}InstrumentStatus;

typedef enum valueType {
    VAL_INT = 0,
    VAL_FLOAT,
    VAL_DOUBLE,
    VAL_BOOL,
    VAL_ENUM,
    VAL_STRING
}ValueType;

typedef enum unitType {
    UNIT_NONE = 0,
    UNIT_FREQ,
    UNIT_AMP
}UnitType;

#define LIGHT_CORNER_RADIUS 3.0f
#define NORMAL_CORNER_RADIUS 5.0f
#define HEAVY_CORNER_RADIUS 10.0f
#define NORMAL_BORDER_WIDTH 1.0f
#define HEAVY_BORDER_WIDTH 2.0f
#define VC_MARGIN 1.0f
#define MENU_WIDTH 150.0f
#define BAR_MENU_HEIGHT 300.0f
#define MEAS_WIDTH 350.0f
#define MEAS_HEIGHT 600.0f
#define BAR_HEIGHT 120.0f
#define NAVBAR_HEIGHT 44.0f
#define ADDINSTRUMENT_HEIGHT 75.0f

#define DEBUG_OUTPUT YES

@class GPUImageiOSBlurFilter;
@class MeasureBarContainerViewController;

@interface ShareSettings : NSObject

@property (nonatomic) BOOL menuTapped;
@property (nonatomic) BOOL measureTapped;

@property (nonatomic) BOOL navPresetMenuButtonAreaTapped;
@property (nonatomic) BOOL presetMenuAreaTapped;
@property (nonatomic) BOOL barPopupMenuAreaTapped;
@property (nonatomic) NSInteger barTappedIndex;
@property (nonatomic) NSInteger currentBarPopupMenuIndex;
@property (nonatomic) NSInteger previousBarPopupMenuIndex;

@property (nonatomic) BOOL menuDisplayed;
@property (nonatomic) BOOL measureDisplayed;
@property (nonatomic) BOOL barPopupMenuDisplayed;
@property (nonatomic) BOOL presetMenuDisplayed;
@property (nonatomic) CGRect barPopupMenuCGRect;
@property (nonatomic) CGRect barCGRect;
@property (nonatomic) CGRect navBarPresetMenuButtonCGRect;
@property (nonatomic) CGRect presetMenuCGRect;

@property (nonatomic) InstrumentStatus currentInstrumentStatus;
@property (nonatomic) NSMutableString *currentInstrument;

@property (nonatomic) NSMutableArray *measureView;

@property (nonatomic) NSInteger measureBarCount;
@property (nonatomic) BOOL useBarRatio;
@property (strong, nonatomic) NSMutableArray *barWidths;
@property (nonatomic) CGFloat totalBarWidth;

@property (weak, nonatomic) UIStoryboard *modeStoryboard;
@property (weak, nonatomic) MeasureBarContainerViewController *barCVC;

@property (nonatomic) GPUImageiOSBlurFilter *blurFilter;

+(id)sharedSettings;

- (void) initMeasureView;
- (void) initMeasureBar;
-(UIImage *)screenShot:(UIViewController *) uiVC saveInAlbum:(BOOL)saveInAlbum;
-(UIImage *)blurryImage:(UIImage *)image;

-(CGFloat) measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width;

@end

#endif
