//
//  UISoftKey.h
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_UISoftKey_h
#define MSA_UISoftKey_h

#import "ShareSettings.h"

@class UISoftKeyEnum;
@class UISoftPanel;

@interface UISoftKey : NSObject

@property (nonatomic) NSMutableString *label;
@property (nonatomic) NSMutableString *labelShort;
@property (nonatomic) NSMutableString *nameString;

@property (nonatomic) ValueType valueType;
@property (nonatomic) int valueTypeInteger;

@property (nonatomic) NSMutableString *valueString;
@property (nonatomic) NSNumber *value;

@property (nonatomic) NSMutableString *unit;

@property (nonatomic) UISoftKeyEnum *softKeyEnum;
@property (nonatomic) UISoftKey *subSoftkey;

@property (nonatomic) UISoftKey *next;
@property (nonatomic) UISoftKey *previous;

@property (nonatomic) UISoftPanel *softPanel;

@end

#endif
