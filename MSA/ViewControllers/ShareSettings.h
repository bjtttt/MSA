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
    MSA_MENU_FULL,
    MSA_MSG
} MSALayout;

@interface ShareSettings : NSObject

//@property (nonatomic) BOOL connectTapped;
@property (nonatomic) BOOL menuTapped;
@property (nonatomic) BOOL barTapped;
@property (nonatomic) BOOL msgTapped;

+ (id)sharedSettings;

@end