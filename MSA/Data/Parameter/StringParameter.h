//
//  StringParameter.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_StringParameter_h
#define MSA_StringParameter_h

#import "Parameter.h"

@interface StringParameter : Parameter

@property (nonatomic) NSMutableString *value;
@property (nonatomic) NSMutableString *valuePrevious;

@property (nonatomic) SEL valueChanged;
@property (nonatomic) SEL valueChanging;
@property (nonatomic) SEL valueTouching;

@end

#endif
