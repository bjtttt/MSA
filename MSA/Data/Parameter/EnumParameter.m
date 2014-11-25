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
    NSAssert(YES == NO, @"EnumParameter can only use initWithEnumDefinition");
    
    if(self = [super init])
    {
    }
    
    return self;
}

- (id) initWithEnumDefinition:(NSMutableArray *)enumDefinition
{
    if(self = [super init])
    {
        self.valueType = VAL_ENUM;
        self.valuePrevious = NO;
        self.value = NO;
        self.enumDefinition = enumDefinition;
        self.valueChanged = nil;
        self.valueChanging = nil;
        self.valueTouching = nil;
    }
    
    return self;
}

-(void)setValue:(int)value
{
    if(self.value == self.valuePrevious)
    {
        if(self.valueTouching != nil)
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
            NSAssert(YES == NO, @"Cannot find value %d in EnumParameter %@", value, self.key);
        
        if(self.valueChanging != nil)
            [self valueChanging];
        
        self.valuePrevious = self.value;
        self.value = value;
        
        if(self.valueChanged != nil)
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
