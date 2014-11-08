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
    VAL_NONE = -1,
    VAL_INT = 0,
    VAL_DOUBLE,
    VAL_BOOL_ONOFF,
    VAL_BOOL_AUTOMAN,
    VAL_ENUM,
    VAL_STRING,
    VAL_IMM = 6
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
@class UISoftMenu;

@interface ShareSettings : NSObject

@property (nonatomic) bool menuTapped;
@property (nonatomic) bool measureTapped;

@property (nonatomic) bool navPresetMenuButtonAreaTapped;
@property (nonatomic) bool presetMenuAreaTapped;
@property (nonatomic) bool barPopupMenuAreaTapped;
@property (nonatomic) int barTappedIndex;
@property (nonatomic) int currentBarPopupMenuIndex;
@property (nonatomic) int previousBarPopupMenuIndex;

@property (nonatomic) bool menuDisplayed;
@property (nonatomic) bool measureDisplayed;
@property (nonatomic) bool barPopupMenuDisplayed;
@property (nonatomic) bool presetMenuDisplayed;
@property (nonatomic) CGRect barPopupMenuCGRect;
@property (nonatomic) CGRect barCGRect;
@property (nonatomic) CGRect navBarPresetMenuButtonCGRect;
@property (nonatomic) CGRect presetMenuCGRect;

@property (nonatomic) InstrumentStatus currentInstrumentStatus;
@property (nonatomic) NSMutableString *currentInstrument;

@property (nonatomic) NSMutableArray *measureView;

@property (nonatomic) int measureBarCount;
@property (nonatomic) bool useBarRatio;
@property (strong, nonatomic) NSMutableArray *barWidths;
@property (nonatomic) float totalBarWidth;

@property (weak, nonatomic) UIStoryboard *modeStoryboard;
@property (weak, nonatomic) MeasureBarContainerViewController *barCVC;

@property (nonatomic) GPUImageiOSBlurFilter *blurFilter;

@property (nonatomic) UISoftMenu *softMenuSystem;

+(id)sharedSettings;

-(void)initMeasureView;
-(void)initMeasureBar;
-(void)initSoftMenuSystem;
-(UIImage *)screenShot:(UIViewController *) uiVC saveInAlbum:(BOOL)saveInAlbum;
-(UIImage *)blurryImage:(UIImage *)image;

-(CGFloat) measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width;

@end

#endif
