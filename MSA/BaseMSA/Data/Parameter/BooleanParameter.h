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

@property (nonatomic) NSString *yesLabel;
@property (nonatomic) NSString *yesLabelShort;
@property (nonatomic) NSString *noLabel;
@property (nonatomic) NSString *noLabelShort;

@property (nonatomic) SEL valueChanged;
@property (nonatomic) SEL valueChanging;
@property (nonatomic) SEL valueTouching;

-(void)valueChangedHandler:(Parameter *)param;
-(void)valueChangingHandler:(Parameter *)param;
-(void)valueTouchingHandler:(Parameter *)param;

@end

#endif
