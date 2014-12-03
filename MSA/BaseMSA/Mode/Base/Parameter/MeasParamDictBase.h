//
//  MeasParamDictBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParamDictBase.h"

@class ShareSettings;
@class MeasBarParamDictBase;
@class ModeParamDictBase;
@class MeasureBase;
@class Parameter;

@interface MeasParamDictBase : ParamDictBase

@property (nonatomic) MeasureBase *measure;
@property (nonatomic) ModeParamDictBase *modePar;
@property (nonatomic) MeasBarParamDictBase *mbarPar;

-(void)addMeasBarParameters;
-(void)addMeasMenuParameters;
-(void)addMeasOtherParameters;

@end