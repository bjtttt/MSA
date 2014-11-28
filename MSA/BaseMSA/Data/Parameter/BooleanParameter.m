//
//  BooleanParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BooleanParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"
//#import "Parameter.h"

@interface BooleanParameter()

@end

@implementation BooleanParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_BOOL;
        self.valuePrevious = NO;
        self.value = NO;
        self.yesLabel = [[NSMutableString alloc] initWithString:@""];
        self.yesLabelShort = [[NSMutableString alloc] initWithString:@""];
        self.noLabel = [[NSMutableString alloc] initWithString:@""];
        self.noLabelShort = [[NSMutableString alloc] initWithString:@""];
        self.valueChanged = nil;
        self.valueChanging = nil;
        self.valueTouching = nil;
    }
    
    return self;
}

-(void)setValue:(bool)value
{
    if(self.value == self.valuePrevious)
    {
        if(self.valueTouching != nil)
            [self valueTouching];
    }
    else
    {
        if(self.valueChanging != nil)
            [self valueChanging];
        
        _valuePrevious = _value;
        _value = value;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:(NSString *)self.key object:self];

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
