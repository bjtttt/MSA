//
//  EnumParameter.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_EnumParameter_h
#define MSA_EnumParameter_h

#import "Parameter.h"

@interface EnumParameter : Parameter

@property (nonatomic) id valuePrevious;
@property (nonatomic) id value;

@property (nonatomic) NSMutableDictionary *memberDict;

@property (nonatomic) SEL valueChanged;
@property (nonatomic) SEL valueChanging;
@property (nonatomic) SEL valueTouching;

//-(void)initWithEnum:(type)

@end

#endif
