//
//  StringParameter.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_ImmediateParameter_h
#define MSA_ImmediateParameter_h

#import "Parameter.h"

@interface StringParameter : Parameter

@property (nonatomic) NSMutableString *value;

-(void)valueChanged;
-(void)valueChanging;

@end

#endif
