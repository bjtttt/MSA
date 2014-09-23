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

typedef enum msaLayout {
    MSA_DISP,
    MSA_DISP_FULL,
    MSA_MENU,
    MSA_MENU_FULL
} MSALayout;

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

#define CORNER_RADIUS 3.0f
#define NORMAL_BORDER_WIDTH 1.0f
#define HEAVY_BORDER_WIDTH 3.0f
#define VC_MARGIN 1.0f
#define MENU_WIDTH 200.0f
#define NAVBAR_HEIGHT 44.0f

@interface ShareSettings : NSObject

@property (nonatomic) BOOL menuTapped;
@property (nonatomic) BOOL barTapped;

@property (nonatomic) MSALayout curMSALayout;
@property (nonatomic) MSALayout prevMSALayout;

+ (id)sharedSettings;

@end

#endif
