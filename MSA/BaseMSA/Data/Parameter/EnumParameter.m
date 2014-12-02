//
//  EnumParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumParameter.h"
#import "ShareSettings.h"
#import "EnumMemberInfo.h"

@interface EnumParameter()

@end

@implementation EnumParameter

- (id) init
{
    [NSException raise:@"EnumParameter::init" format:@"EnumParameter can only use initWithEnumDefinition:[withDefaultValue:]"];
    
    if(self = [super init])
    {
    }
    
    return self;
}

- (id) initWithKey:(NSString *)key withEnumDefinition:(NSMutableArray *)enumDefinition withDefaultValue:(int)defaultValue
{
    if(key == nil)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"nil key"];
        return nil;
    }
    if(key == nil)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"Empty key"];
        return nil;
    }
    if(enumDefinition == nil)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"\"%@\" cannot initiate nil ENUM", key];
        return nil;
    }
    if(enumDefinition.count < 1)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"\"%@\" cannot initiate empty ENUM", key];
        return nil;
    }

    if(self = [super init])
    {
        bool found = false;
        for (EnumMemberInfo *emi in enumDefinition) {
            if(defaultValue == emi.value)
            {
                found = YES;
                break;
            }
        }
        if(found == NO)
            [NSException raise:@"EnumParameter" format:@"\"%@ \"::initWithEnumDefinition:withDefaultValue: uses a wrong default value", key];
        
        self.key = key;
        self.valueType = VAL_ENUM;
        self.valuePrevious = defaultValue;
        self.value = defaultValue;
        self.enumDefinition = enumDefinition;
    }
    
    return self;
}

- (id) initWithKey:(NSString *)key withEnumDefinition:(NSMutableArray *)enumDefinition
{
    if(key == nil)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"nil key"];
        return nil;
    }
    if(key == nil)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"Empty key"];
        return nil;
    }
    if(enumDefinition == nil)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"\"%@\" cannot initiate nil ENUM", key];
        return nil;
    }
    if(enumDefinition.count < 1)
    {
        [NSException raise:@"EnumParameter::initWithKey:withEnumDefinition:withDefaultValue:" format:@"\"%@\" cannot initiate empty ENUM", key];
        return nil;
    }
    
    int defValue = ((EnumMemberInfo *)enumDefinition[0]).value;
    
    return [self initWithKey:key withEnumDefinition:enumDefinition withDefaultValue:defValue];
}

-(void)setValue:(int)value
{
    if(_value == _valuePrevious)
    {
        if(_valueTouching != nil)
            [self valueTouching];
    }
    else
    {
        bool found = NO;
        for(EnumMemberInfo *emi in self.enumDefinition)
        {
            if(emi.value == value)
            {
                found = YES;
                break;
            }
        }
        if(found == NO)
            [NSException raise:@"EnumParameter::setValue:" format:@"\"%@\" doesn't contain value %d in ENUM", self.key, value];
        
        if(self.valueChanging != nil)
            [self valueChanging];
        
        _valuePrevious = _value;
        _value = value;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:(NSString *)self.key object:self];
        
        if(_valueChanged != nil)
            [self valueChanged];
    }
}

-(void)valueChangedHandler:(Parameter *)param
{
    [self.shareSettings performSelector:@selector(valueChanged:) withObject:param];
}

-(void)valueChangingHandler:(Parameter *)param
{
    [self.shareSettings performSelector:@selector(valueChanging:) withObject:param];
}

-(void)valueTouchingHandler:(Parameter *)param
{
    [self.shareSettings performSelector:@selector(valueTouching:) withObject:param];
}

@end
