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

@interface UISoftKeyEnumItem : NSObject

@property (nonatomic) int value;
@property (nonatomic) NSMutableString *labelShort;
@property (nonatomic) NSMutableString *label;

@property (nonatomic) UISoftKeyEnumItem *next;
@property (nonatomic) UISoftKeyEnumItem *previous;

@property (nonatomic) UISoftKeyEnum *softkeyEnum;

@end

#endif
