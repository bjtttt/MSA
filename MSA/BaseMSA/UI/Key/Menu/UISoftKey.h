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
@class BooleanParameter;

@interface UISoftKey : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic, readonly) NSString *label;
@property (nonatomic, readonly) NSString *labelShort;
@property (nonatomic, readonly) NSString *nameString;

@property (nonatomic, readonly) NSString *nameStringSubBoolean;

@property (nonatomic) SoftKeyType softKeyType;

@property (nonatomic, readonly) NSString *valueString;

@property (nonatomic, readonly) NSNumber *valueNumber;
@property (nonatomic, readonly) NSString *unit;
@property (nonatomic, readonly) NSString *formattedValue;

@property (nonatomic, readonly) bool valueSubBoolean;

@property (nonatomic) EnumMemberInfo *enumMemberInfo;

@property (nonatomic) UISoftKeyEnum *softKeyEnum;
@property (nonatomic) UISoftKeyEnum *softKeySubBoolean;

@property (nonatomic) UISoftPanel *softPanel;
@property (nonatomic) UISoftPanel *subSoftPanel;

@property (nonatomic) Parameter *connectParam;
@property (nonatomic) BooleanParameter *connectSubBoolean;

-(void)initSoftKeyEnum;
-(void)initSoftKeySubBoolean;

-(void)expandEnumSoftPanel;

-(UISoftKeyEnumItem *)addSoftkeyEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort;
-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value;

-(id)initWithConfig:(ShareSettings *)ss;

@end

#endif
