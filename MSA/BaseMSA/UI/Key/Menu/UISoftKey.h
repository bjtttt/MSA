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
@class EnumMemberInfo;

@interface UISoftKey : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic, readonly) NSMutableString *label;
@property (nonatomic, readonly) NSMutableString *labelShort;
@property (nonatomic, readonly) NSMutableString *nameString;

@property (nonatomic, readonly) NSMutableString *label2nd;
@property (nonatomic, readonly) NSMutableString *labelShort2nd;
@property (nonatomic, readonly) NSMutableString *nameString2nd;

@property (nonatomic) SoftKeyType softKeyType;

@property (nonatomic, readonly) NSMutableString *valueString;

@property (nonatomic, readonly) NSNumber *valueNumber;
@property (nonatomic, readonly) NSMutableString *unit;
@property (nonatomic, readonly) NSMutableString *formattedValue;

@property (nonatomic, readonly) NSNumber *valueNumber2nd;

@property (nonatomic) EnumMemberInfo *enumMemberInfo;

@property (nonatomic) UISoftKeyEnum *softKeyEnum;
@property (nonatomic) UISoftKeyEnum *softKeyEnum2nd;

@property (nonatomic) UISoftPanel *softPanel;
@property (nonatomic) UISoftPanel *subSoftPanel;

@property (nonatomic) Parameter *connectParam;
@property (nonatomic) Parameter *connect2ndParam;

-(void)initSoftKeyEnum;
-(void)initSoftKeyEnumFromParameter:(Parameter *)par;

-(void)initSoftKeyEnum2nd;
-(void)initSoftKeyEnum2ndFromParameter:(Parameter *)par;???

-(void)expandEnumSoftPanel;

-(UISoftKeyEnumItem *)addSoftkeyEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort;
-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value;

@end

#endif
