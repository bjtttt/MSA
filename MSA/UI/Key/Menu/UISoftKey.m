//
//  UISoftKey.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftKey.h"
#import "UISoftKeyEnum.h"
#import "UISoftKeyEnumItem.h"

@interface UISoftKey()

@end

@implementation UISoftKey

- (id) init
{
    if(self = [super init])
    {
        self.label = [[NSMutableString alloc] initWithString:@""];
        self.labelShort = [[NSMutableString alloc] initWithString:@""];
        
        self.nameString = [[NSMutableString alloc] initWithString:@""];
        
        self.valueType = VAL_NONE;
        self.valueTypeInteger = -1;
        
        self.valueString = [[NSMutableString alloc] initWithString:@""];
        self.value = 0;
        self.unit = [[NSMutableString alloc] initWithString:@""];
        
        self.softKeyEnum = nil;

        self.next = nil;
        self.previous = nil;
        self.softPanel = nil;
    }
    
    return self;
}

-(void)setValueType:(ValueType)valueType
{
    if(self.valueType != valueType)
    {
        self.valueType = valueType;
        self.valueTypeInteger = (int)valueType;
    }
}

-(void)setValueTypeInteger:(int)valueTypeInteger
{
    if(self.valueTypeInteger != valueTypeInteger &&
       valueTypeInteger >= -1 &&
       valueTypeInteger < (int)VAL_IMM)
    {
        self.valueTypeInteger = valueTypeInteger;
        self.valueType = (ValueType)valueTypeInteger;
    }
}

-(void)initSoftKeyEnum//:(NSString *)withName
{
    self.softKeyEnum = [[UISoftKeyEnum alloc] init];
    //self.softKeyEnum.name = [[NSMutableString alloc] initWithString:withName];
}

-(UISoftKeyEnumItem *)addSoftkeyEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort
{
    NSAssert(self.softKeyEnum != nil, @"Softkey %@ Enum is nil", self.label);
    
    return [self.softKeyEnum addEnumItem:value label:label labelShort:labelShort];
}

-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value
{
    NSAssert(self.softKeyEnum != nil, @"Softkey %@ Enum is nil", self.label);
    
    return [self.softKeyEnum findEnumItemByValue:value];
}

@end
