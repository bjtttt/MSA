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
@class UISoftKeyEnumItem;
@class UISoftPanel;
@class Parameter;

@interface UISoftKey : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic, readonly) NSMutableString *label;
@property (nonatomic, readonly) NSMutableString *labelShort;
@property (nonatomic, readonly) NSMutableString *nameString;

@property (nonatomic) SoftKeyType softKeyType;

@property (nonatomic, readonly) NSMutableString *valueString;

@property (nonatomic, readonly) NSNumber *valueNumber;
@property (nonatomic, readonly) NSMutableString *unit;
@property (nonatomic, readonly) NSMutableString *formattedValue;

@property (nonatomic) UISoftKeyEnum *softKeyEnum;

@property (nonatomic) UISoftPanel *subSoftPanel;
@property (nonatomic) UISoftKey *parentSoftkey;

@property (nonatomic) UISoftKey *next;
@property (nonatomic) UISoftKey *previous;

@property (nonatomic) UISoftPanel *softPanel;

@property (nonatomic) Parameter *connectParam;

-(void)initSoftKeyEnum;
-(void)initSoftKeyEnumFromParameter:(Parameter *)par;

-(void)expandEnumSoftPanel;

-(UISoftKeyEnumItem *)addSoftkeyEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort;
-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value;

@end

#endif
