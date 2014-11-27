//
//  IntParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntParameter.h"
#import "ShareSettings.h"
//#import "Parameter.h"

@interface IntParameter()

@end

@implementation IntParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_INT;
        self.valuePrevious = 0;
        self.value = 0;
        self.valueChanged = nil;
        self.valueChanging = nil;
        self.valueTouching = nil;
    }
    
    return self;
}

-(void)setValue:(long)value
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
        
        self.valuePrevious = self.value;
        self.value = value;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:(NSString *)self.key object:self];

        if(self.valueChanged != nil)
            [self valueChanged];
    }
}

-(NSString *)valueString
{
    return [NSString stringWithFormat:@"%ld", self.value];
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
