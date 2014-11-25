//
//  DoubleParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoubleParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface DoubleParameter()

@end

@implementation DoubleParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_DOUBLE;
        self.valuePrevious = 0.0;
        self.value = 0.0;
        self.unit = [[NSMutableString alloc] initWithString:@""];
    }
    
    return self;
}

-(void)setValue:(double)value
{
    if(self.value == self.valuePrevious)
    {
        [self valueChanging];
    }
    else
    {
        [self valueChanging];
    
        self.valuePrevious = self.value;
        self.value = value;
    
        [self valueChanged];
    }
}

-(NSString *)valueString
{
    return [NSString stringWithFormat:@"%f", self.value];
}

-(NSString *)valueStringWithUnit
{
    NSString *str = [NSString stringWithFormat:@"%f", self.value];
    if(self.unit == nil || [self.unit length] < 1)
        return str;
    return [str stringByAppendingString:(NSString *)self.unit];
}

@end
