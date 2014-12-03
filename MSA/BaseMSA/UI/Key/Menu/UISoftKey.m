//
//  UISoftKey.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftPanel.h"
#import "UISoftKey.h"
#import "UISoftKeyEnum.h"
#import "UISoftKeyEnumItem.h"
#import "BooleanParameter.h"
#import "EnumParameter.h"
#import "DoubleParameter.h"
#import "TimeParameter.h"
#import "AmplitudeParameter.h"
#import "FrequencyParameter.h"
#import "RelativeAmplitudeParameter.h"
#import "IntParameter.h"
#import "StringParameter.h"
#import "EnumMemberInfo.h"

@interface UISoftKey()

@end

@implementation UISoftKey

-(id)init
{
    [NSException raise:@"UISoftKey::init" format:@"Call UISoftKey::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if(self = [super init])
    {
        _shareSettings = ss;
        _softKeyType = KEY_IMM;
    }
    
    return self;
}

-(NSString *)label
{
    if(_softKeyType == KEY_ENUM_ITEM)
        return _enumMemberInfo.display;
    else
        return _connectParam.label;
}

-(NSString *)labelShort
{
    if(_softKeyType == KEY_ENUM_ITEM)
        return [_enumMemberInfo.displayShort mutableCopy];
    else
        return _connectParam.labelShort;
}

-(NSString *)nameString
{
    return _connectParam.key;
}

-(NSString *)nameStringSubBoolean
{
    if(_softKeyType == KEY_VALUE_BOOL || _softKeyType == KEY_ENUM_BOOL)
        return _connectSubBoolean.key;
    else
    {
        [NSException raise:@"UISoftKey::nameStringSubBoolean" format:@"SoftKey(\"%@\") - Type(%d): Has no sub BooleanParameter.", self.label, _softKeyType];
        return nil;
    }
}

-(NSString *)valueString
{
    switch(self.connectParam.valueType)
    {
        default:
            [NSException raise:@"UISoftKey::valueString" format:@"SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") has no string value.", self.label, _softKeyType, _connectParam.key];
            return nil;
        case VAL_STRING:
            return ((StringParameter *)self.connectParam).value;
    }
}

-(NSNumber *)valueNumber
{
    if(self.softKeyType == KEY_ENUM_ITEM)
        return [NSNumber numberWithInt:self.enumMemberInfo.value];
    
    switch(self.connectParam.valueType)
    {
        default:
            [NSException raise:@"UISoftKey::valueString" format:@"SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") has no number value.", self.label, _softKeyType, _connectParam.key];
            return nil;
        case VAL_AMP:
            return [NSNumber numberWithDouble:((AmplitudeParameter *)self.connectParam).value];
        case VAL_RELAMP:
            return [NSNumber numberWithDouble:((RelativeAmplitudeParameter *)self.connectParam).value];
        case VAL_FREQ:
            return [NSNumber numberWithDouble:((FrequencyParameter *)self.connectParam).value];
        case VAL_TIME:
            return [NSNumber numberWithDouble:((TimeParameter *)self.connectParam).value];
        case VAL_DOUBLE:
            return [NSNumber numberWithDouble:((DoubleParameter *)self.connectParam).value];
        case VAL_INT:
            return [NSNumber numberWithLong:((IntParameter *)self.connectParam).value];
    }
}

-(bool)valueSubBoolean
{
    if(self.softKeyType == KEY_VALUE_BOOL || self.softKeyType == KEY_ENUM_BOOL)
        return self.connectSubBoolean.value;
    
    [NSException raise:@"UISoftKey::valueSubBoolean" format:@"SoftKey(\"%@\") - Type(%d): Has no sub BooleanParameter.", self.label, _softKeyType];
    return false;
}

-(NSString *)unit
{
    if(self.softKeyType == KEY_ENUM_ITEM)
    {
        [NSException raise:@"UISoftKey::unit" format:@"SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") has no unit.", self.label, _softKeyType, _connectParam.key];
        return nil;
    }
    
    switch(self.connectParam.valueType)
    {
        default:
            [NSException raise:@"UISoftKey::unit" format:@"SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") has no unit.", self.label, _softKeyType, _connectParam.key];
            return nil;
        case VAL_AMP:
            return ((AmplitudeParameter *)self.connectParam).unit;
        case VAL_RELAMP:
            return ((RelativeAmplitudeParameter *)self.connectParam).unit;
        case VAL_FREQ:
            return ((FrequencyParameter *)self.connectParam).unit;
        case VAL_TIME:
            return ((TimeParameter *)self.connectParam).unit;
        case VAL_DOUBLE:
            return ((DoubleParameter *)self.connectParam).unit;
        case VAL_INT:
            return ((IntParameter *)self.connectParam).unit;
    }
}

-(NSString *)formattedValue
{
    if(self.softKeyType == KEY_ENUM_ITEM)
    {
        [NSException raise:@"UISoftKey::unit" format:@"SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") has no formatted value.", self.label, _softKeyType, _connectParam.key];
        return nil;
    }

    switch(self.connectParam.valueType)
    {
        default:
            [NSException raise:@"UISoftKey::unit" format:@"SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") has no formatted value.", self.label, _softKeyType, _connectParam.key];
            return nil;
        case VAL_RELAMP:
        case VAL_AMP:
        {
            NSMutableString *msv = [[self.valueNumber stringValue] mutableCopy];
            if(self.unit.length > 1)
                [msv appendString:@" "];
            [msv appendString:(NSString *)self.unit];
            return (NSString *)msv;
        }
        case VAL_FREQ:
        {
            NSMutableString *msv = [[self.shareSettings convertFrequency:[self.valueNumber doubleValue]] mutableCopy];
            [msv appendString:(NSString *)self.unit];
            return (NSString *)msv;
        }
        case VAL_TIME:
        {
            NSMutableString *msv = [[self.shareSettings convertTime:[self.valueNumber doubleValue]] mutableCopy];
            [msv appendString:(NSString *)self.unit];
            return msv;
        }
        case VAL_STRING:
            return self.valueString;
        case VAL_DOUBLE:
        case VAL_INT:
        {
            NSMutableString *msv = [[self.valueNumber stringValue] mutableCopy];
            if(self.unit.length > 1)
                [msv appendString:@" "];
            [msv appendString:(NSString *)self.unit];
            return (NSString *)msv;
        }
    }
}

-(void)initSoftKeyEnum
{
    if(_connectParam == nil)
    {
        [NSException raise:@"UISoftKey::initSoftKeyEnum" format:@"SoftKey(\"%@\") - Type(%d) : Parameter is nil.", self.label, _softKeyType];
        return;
    }
    
    if(![_connectParam isKindOfClass:BooleanParameter.class] && ![_connectParam isKindOfClass:EnumParameter.class])
    {
        [NSException raise:@"UISoftKey::initSoftKeyEnum" format:@"SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") is NOT BooleanParameter or EnumParameter.", self.label, _softKeyType, _connectParam.key];
        return;
    }
    
    UISoftKeyEnum *uiSKE = [[UISoftKeyEnum alloc] initWithConfig:_shareSettings];
    if([_connectParam isKindOfClass:BooleanParameter.class])
    {
        BooleanParameter *bp = (BooleanParameter *)_connectParam;
        [uiSKE addEnumItem:0 label:bp.noLabel labelShort:bp.noLabelShort];
        [uiSKE addEnumItem:1 label:bp.yesLabel labelShort:bp.yesLabelShort];
    }
    else
    {
        EnumParameter * ep = (EnumParameter *)_connectParam;
        int count = (int)ep.enumDefinition.count;
        for(int i = 0; i < count; i++)
        {
            UISoftKeyEnumItem *ei = (UISoftKeyEnumItem *)ep.enumDefinition[i];
            [uiSKE addEnumItem:ei.value label:ei.label labelShort:ei.labelShort];
        }
    }
    
    _softKeyEnum = uiSKE;
    uiSKE.softkey=self;
}

-(void)initSoftKeySubBoolean{
    if(_connectSubBoolean == nil)
    {
        [NSException raise:@"UISoftKey::initSoftKeyEnum" format:@"SoftKey(\"%@\") - Type(%d) : Parameter is nil.", self.label, _softKeyType];
        return;
    }
    
    UISoftKeyEnum *uiSKE = [[UISoftKeyEnum alloc] initWithConfig:_shareSettings];
    [uiSKE addEnumItem:0 label:_connectSubBoolean.noLabel labelShort:_connectSubBoolean.noLabelShort];
    [uiSKE addEnumItem:1 label:_connectSubBoolean.yesLabel labelShort:_connectSubBoolean.yesLabelShort];
    
    _softKeySubBoolean = uiSKE;
    uiSKE.softkey = self;
}

-(UISoftKeyEnumItem *)addSoftkeyEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort
{
    if(_softKeyEnum == nil)
    {
        [NSException raise:@"UISoftKey::addSoftkeyEnumItem:label:labelShort:" format:@"SoftKey(\"%@\") - Type(%d) : Enum item array is nil.", self.label, _softKeyType];
        
        return nil;
    }
    
    return [_softKeyEnum addEnumItem:value label:label labelShort:labelShort];
}

-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value
{
    if(_softKeyEnum == nil)
    {
        [NSException raise:@"UISoftKey::findEnumItemByValue:" format:@"SoftKey(\"%@\") - Type(%d) : Enum item array is nil.", self.label, _softKeyType];
        
        return nil;
    }
    
    return [_softKeyEnum findEnumItemByValue:value];
}

-(void)expandEnumSoftPanel
{
    if(![_connectParam isKindOfClass:EnumParameter.class])
    {
        [NSException raise:@"UISoftKey::expandEnumSoftPanel" format:@"SoftPanel (\"%@\") - SoftKey(\"%@\") - Type(%d) : Parameter (\"%@\") is not an EnumParameter", _softPanel.title, self.label, _softKeyType, _connectParam.key];
        return;
    }
    
    if(self.softKeyEnum == nil)
    {
        [NSException raise:@"UISoftKey::expandEnumSoftPanel" format:@"SoftPanel (\"%@\") - SoftKey(\"%@\") - Type(%d) : Enum item array is nil", _softPanel.title, self.label, _softKeyType];
        return;
    }
    if(self.softKeyEnum.itemArray.count < 1)
    {
        [NSException raise:@"UISoftKey::expandEnumSoftPanel" format:@"SoftPanel (\"%@\") - SoftKey(\"%@\") - Type(%d) : Enum item array is empty", _softPanel.title, self.label, _softKeyType];
        return;
    }
    
    EnumParameter * ep = (EnumParameter *)self.connectParam;
    UISoftPanel *uiSP = [[UISoftPanel alloc] initWithConfig:_shareSettings];
    uiSP.shareSettings = self.shareSettings;
    uiSP.title = self.label;
    self.subSoftPanel = uiSP;
    uiSP.parentSoftKey = self;
    for(EnumMemberInfo *emi in ep.enumDefinition)
    {
        UISoftKey *uiSK = [[UISoftKey alloc] initWithConfig:_shareSettings];
        uiSK.shareSettings = uiSP.shareSettings;
        uiSK.softPanel = uiSP;
        uiSK.softKeyType = KEY_ENUM_ITEM;
        uiSK.connectParam = self.connectParam;
        uiSK.enumMemberInfo = emi;
        [uiSP.keyArray addObject:uiSK];
    }
}

@end
