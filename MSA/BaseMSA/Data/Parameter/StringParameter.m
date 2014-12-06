//
//  StringParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface StringParameter()

@end

@implementation StringParameter

-(instancetype)init
{
    [NSException raise:@"StringParameter::init" format:@"Call StringParameter::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_STRING;
    }
    
    return self;
}

-(void)setValue:(NSMutableString *)value
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
