//
//  ShareSettings.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-27.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum msaLayout {
    MSA_DISP,
    MSA_DISP_FULL,
    MSA_MENU,
    MSA_MENU_FULL
} MSALayout;

#define CORNER_RADIUS 3.0f
#define BORDER_WIDTH 1.0f
#define VC_MARGIN 1.0f
#define MENU_WIDTH 200.0f

@interface ShareSettings : NSObject

@property (nonatomic) BOOL menuTapped;
@property (nonatomic) BOOL barTapped;

@property (nonatomic) MSALayout curMSALayout;
@property (nonatomic) MSALayout prevMSALayout;

+ (id)sharedSettings;

@end