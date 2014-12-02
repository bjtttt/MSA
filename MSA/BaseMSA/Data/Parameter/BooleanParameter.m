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
    }
    
    return self;
}

-(void)setValue:(bool)value
{
    if(_value == _valuePrevious)
    {
        if(_valueTouching != nil)
            [self valueTouching];
    }
    else
    {
        if(_valueChanging != nil)
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
