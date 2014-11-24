//
//  BooleanParameter.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_BooleanParameter_h
#define MSA_BooleanParameter_h

#import "Parameter.h"

@interface BooleanParameter : Parameter

@property (nonatomic) bool valuePrevious;
@property (nonatomic) bool value;

@property (nonatomic) SEL valueChanged;
@property (nonatomic) SEL valueChanging;
@property (nonatomic) SEL valueTouching;

@end

#endif
