//
//  DoubleParameter.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_DoubleParameter_h
#define MSA_DoubleParameter_h

#import "Parameter.h"

@interface DoubleParameter : Parameter

@property (nonatomic) double valuePrevious;
@property (nonatomic) double value;

@property (nonatomic) NSMutableString *unit;

@property (nonatomic) SEL valueChanged;
@property (nonatomic) SEL valueChanging;
@property (nonatomic) SEL valueTouching;

@property (nonatomic, readonly) NSString *valueString;
@property (nonatomic, readonly) NSString *valueStringWithUnit;

@end

#endif