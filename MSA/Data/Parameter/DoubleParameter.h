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

@property (nonatomic,assign) SEL valueChanged;
@property (nonatomic,assign) SEL valueChanging;
@property (nonatomic,assign) SEL valueTouching;

@property (nonatomic, readonly) NSString *valueString;
@property (nonatomic, readonly) NSString *valueStringWithUnit;

-(void)valueChangedHandler:(Parameter *)param;
-(void)valueChangingHandler:(Parameter *)param;
-(void)valueTouchingHandler:(Parameter *)param;

@end

#endif
