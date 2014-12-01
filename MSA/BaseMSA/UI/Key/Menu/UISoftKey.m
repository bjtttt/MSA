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

@interface UISoftKey()

@end

@implementation UISoftKey

- (id) init
{
    if(self = [super init])
    {
        self.softKeyType = KEY_IMM;
        
        self.softKeyEnum = nil;

        self.next = nil;
        self.previous = nil;
        self.softPanel = nil;
    }
    
    return self;
}

-(NSMutableString *)label
{
    return self.connectParam.label;
}

-(NSMutableString *)labelShort
{
    return self.connectParam.labelShort;
}

-(NSMutableString *)nameString
{
    return self.connectParam.key;
}

-(NSMutableString *)valueString
{
    switch(self.connectParam.valueType)
    {
        default:
            NSAssert(YES==NO, @"Current Parameter %@ with type %d has no string value.", self.connectParam.key, self.connectParam.valueType);
            return nil;
        case VAL_STRING:
            return ((StringParameter *)self.connectParam).value;
    }
}

-(NSNumber *)valueNumber
{
    switch(self.connectParam.valueType)
    {
        default:
            NSAssert(YES==NO, @"Current Parameter %@ with type %d has no number value.", self.connectParam.key, self.connectParam.valueType);
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

-(NSMutableString *)unit
{
    switch(self.connectParam.valueType)
    {
        default:
            NSAssert(YES==NO, @"Current Parameter %@ with type %d has no unit.", self.connectParam.key, self.connectParam.valueType);
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

-(NSMutableString *)formattedValue
{
    switch(self.connectParam.valueType)
    {
        default:
            return [@"" mutableCopy];
        case VAL_RELAMP:
        case VAL_AMP:
        {
            NSMutableString *msv = [[self.valueNumber stringValue] mutableCopy];
            if(self.unit.length > 1)
                [msv appendString:@" "];
            [msv appendString:(NSString *)self.unit];
            return msv;
        }
        case VAL_FREQ:
        {
            NSMutableString *msv = [[self.shareSettings convertFrequency:[self.valueNumber doubleValue]] mutableCopy];
            [msv appendString:(NSString *)self.unit];
            return msv;
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
            return msv;
        }
    }
}

-(void)initSoftKeyEnum//:(NSString *)withName
{
    self.softKeyEnum = [[UISoftKeyEnum alloc] init];
    self.softKeyEnum.softkey=self;
    //self.softKeyEnum.name = [[NSMutableString alloc] initWithString:withName];
}

-(void)initSoftKeyEnumFromParameter:(Parameter *)par
{
    if(par == nil)
    {
        NSAssert(YES==NO, @"par is a nil parameter for initSoftKeyEnumFromParameter");
        return;
    }
    
    if(![par isKindOfClass:BooleanParameter.class] && ![par isKindOfClass:EnumParameter.class])
    {
        NSAssert(YES==NO, @"%@ is not BooleanParameter or EnumParameter", par);
        return;
    }
    
    UISoftKeyEnum *uiSKE = [[UISoftKeyEnum alloc] init];
    if([par isKindOfClass:BooleanParameter.class])
    {
        [uiSKE addEnumItem:0 label:((BooleanParameter *)par).noLabel labelShort:((BooleanParameter *)par).noLabelShort];
        [uiSKE addEnumItem:1 label:((BooleanParameter *)par).yesLabel labelShort:((BooleanParameter *)par).yesLabelShort];
    }
    else
    {
        EnumParameter * ep = (EnumParameter *)par;
        int count = (int)ep.enumDefinition.count;
        for(int i = 0; i < count; i++)
        {
            [uiSKE addEnumItem:((UISoftKeyEnumItem *)ep.enumDefinition[i]).value label:((UISoftKeyEnumItem *)ep.enumDefinition[i]).label labelShort:((UISoftKeyEnumItem *)ep.enumDefinition[i]).labelShort];
        }
    }
    
    self.softKeyEnum = uiSKE;
    self.softKeyEnum.softkey=self;
}

-(UISoftKeyEnumItem *)addSoftkeyEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort
{
    NSAssert(self.softKeyEnum != nil, @"UISoftPanel %@ UISoftkey %@ Enum is nil", self.softPanel.title, self.label);
    
    return [self.softKeyEnum addEnumItem:value label:label labelShort:labelShort];
}

-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value
{
    NSAssert(self.softKeyEnum != nil, @"UISoftPanel %@ UISoftkey %@ Enum is nil", self.softPanel.title, self.label);
    
    return [self.softKeyEnum findEnumItemByValue:value];
}

-(void)expandEnumSoftPanel
{
    if(self.softKeyEnum == nil)
        return;
    
    if(self.softKeyEnum.itemArray.count < 1)
    {
        NSAssert(self.softKeyEnum != nil, @"UISoftPanel %@ UISoftkey %@ Enum is empty and cannot be expanded", self.softPanel.title, self.label);
        
        return;
    }
    
    
}

@end
