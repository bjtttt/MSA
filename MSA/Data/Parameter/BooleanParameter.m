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
    }
    
    return self;
}

-(void)setValue:(bool)value
{
    if(self.value == self.valuePrevious)
    {
        [self valueTouching];
    }
    else
    {
        [self valueChanging];
        
        self.valuePrevious = self.value;
        self.value = value;
        
        [self valueChanged];
    }
}

@end
