//
//  UISoftKeyEnumItem.h
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_UISoftKeyEnumItem_h
#define MSA_UISoftKeyEnumItem_h

#import "ShareSettings.h"

@class UISoftKeyEnum;
@class ShareSettings;

@interface UISoftKeyEnumItem : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) int value;
@property (nonatomic) NSString *labelShort;
@property (nonatomic) NSString *label;

@property (nonatomic) UISoftKeyEnum *softkeyEnum;

@property (nonatomic) Parameter *connectParam;
@property (nonatomic) int *connectEnumValue;


@end

#endif
