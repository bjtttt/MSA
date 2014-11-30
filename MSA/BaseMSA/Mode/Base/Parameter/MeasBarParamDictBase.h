//
//  MeasBarParamDictBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParamDictBase.h"

@class MeasureBase;

@interface MeasBarParamDictBase : ParamDictBase

@property (nonatomic) MeasureBase *measure;

@property (nonatomic) ModeParamDictBase *modePar;

-(void)addBarParameters;

-(void)addBar0Parameters;
-(void)addBar1Parameters;
-(void)addBar2Parameters;
-(void)addBar3Parameters;
-(void)addBar4Parameters;
-(void)addBar5Parameters;
-(void)addBar6Parameters;
-(void)addBar7Parameters;
-(void)addBar8Parameters;
-(void)addBar9Parameters;

@end