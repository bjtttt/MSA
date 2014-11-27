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

@property (nonatomic) int valuePrevious;
@property (nonatomic) int value;

@property (nonatomic) NSMutableArray *enumDefinition;

@property (nonatomic) SEL valueChanged;
@property (nonatomic) SEL valueChanging;
@property (nonatomic) SEL valueTouching;

- (id) initWithEnumDefinition:(NSMutableArray *)enumDefinition;

-(void)valueChangedHandler:(Parameter *)param;
-(void)valueChangingHandler:(Parameter *)param;
-(void)valueTouchingHandler:(Parameter *)param;

@end

#endif
