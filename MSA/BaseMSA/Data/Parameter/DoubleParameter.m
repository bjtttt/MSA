//
//  DoubleParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoubleParameter.h"

@interface DoubleParameter()

@end

@implementation DoubleParameter

-(id)init
{
    [NSException raise:@"DoubleParameter::init" format:@"Call DoubleParameter::initWithConfig: instead"];
    
    return nil;
}

- (id) initWithConfig:(ShareSettings *)ss
{
    if(self = [super initWithConfig:ss])
    {
        self.valueType = VAL_DOUBLE;
    }
    
    return self;
}

-(void)setValue:(double)value
{
    if(_value == _valuePrevious)
    {
        if(self.valueTouching != nil)
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

-(NSString *)valueString
{
    return [NSString stringWithFormat:@"%f", _value];
}

-(NSString *)valueStringWithUnit
{
    NSString *str = [NSString stringWithFormat:@"%f", _value];
    if(_unit == nil || [_unit length] < 1)
        return str;
    return [str stringByAppendingString:(NSString *)_unit];
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
