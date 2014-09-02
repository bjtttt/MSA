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

@interface ShareSettings : NSObject

@property (nonatomic) BOOL menuTapped;
@property (nonatomic) BOOL barTapped;

@property (nonatomic) MSALayout curMSALayout;
@property (nonatomic) MSALayout prevMSALayout;

+ (id)sharedSettings;

@end