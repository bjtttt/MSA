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

@class Parameter;

typedef NS_ENUM(int, MSGType) {
    MSG_CURRENT_CONDITIONS = 0,
    MSG_HISTORY,
    MSG_SETTINGS
};

typedef NS_ENUM(int, SYSTType) {
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
};

typedef NS_ENUM(int, InstrumentStatus) {
    INST_DISC = 0,
    INST_INCONN,
    INST_CONN,
    INST_INDISC
};

typedef NS_ENUM(int, ValueType) {
    VAL_NONE = -1,
    VAL_INT = 0,
    VAL_DOUBLE,
    VAL_BOOL,
    VAL_BOOL_ONOFF,
    VAL_BOOL_AUTOMAN,
    VAL_ENUM,
    VAL_STRING,
    VAL_FREQ,
    VAL_AMP,
    VAL_RELAMP,
    VAL_TIME,
    VAL_IMM = 10
};

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
@class ParameterManager;

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

@property (nonatomic) bool useBarRatio;
@property (nonatomic) int measureBarCount;
@property (strong, nonatomic) NSMutableArray *barWidths;
@property (strong, nonatomic) NSMutableArray *barSmallWidths;
@property (nonatomic) float totalBarWidth;
@property (nonatomic) float totalBarSmallWidth;
@property (nonatomic) NSMutableArray *mbarDetails;

@property (weak, nonatomic) UIStoryboard *modeStoryboard;
@property (weak, nonatomic) MeasureBarContainerViewController *barCVC;

@property (nonatomic) GPUImageiOSBlurFilter *blurFilter;

@property (nonatomic) NSMutableDictionary *softMenuDict;

//@property (nonatomic) NSDictionary *dataParameters;
@property (nonatomic) ParameterManager *parManager;

@property (nonatomic) NSMutableString *prevMeasure;
@property (nonatomic) NSMutableString *curMeasure;

+(id)sharedSettings;

-(void)initMeasureView;
//-(void)initMeasureBar;
-(void)initSoftMenuSystem;
-(UIImage *)screenShot:(UIViewController *) uiVC saveInAlbum:(BOOL)saveInAlbum;
-(UIImage *)blurryImage:(UIImage *)image;

-(void)switchMeasure:(NSString *)curMeas;

-(CGFloat) measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width;

-(void)valueTouching:(Parameter *)param;
-(void)valueChanging:(Parameter *)param;
-(void)valueChanged:(Parameter *)param;

@end

#endif
