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

@property (nonatomic,assign) SEL valueChanged;
@property (nonatomic,assign) SEL valueChanging;
@property (nonatomic,assign) SEL valueTouching;

-(void)valueChangedHandler:(Parameter *)param;
-(void)valueChangingHandler:(Parameter *)param;
-(void)valueTouchingHandler:(Parameter *)param;

@end

#endif
