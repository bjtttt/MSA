//
//  IntParameter.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_IntParameter_h
#define MSA_IntParameter_h

#import "Parameter.h"

@interface IntParameter : Parameter

@property (nonatomic) long valuePrevious;
@property (nonatomic) long value;

@property (nonatomic,assign) SEL valueChanged;
@property (nonatomic,assign) SEL valueChanging;
@property (nonatomic,assign) SEL valueTouching;

@property (nonatomic, readonly) NSString *valueString;

-(void)valueChangedHandler:(Parameter *)param;
-(void)valueChangingHandler:(Parameter *)param;
-(void)valueTouchingHandler:(Parameter *)param;

@end

#endif
