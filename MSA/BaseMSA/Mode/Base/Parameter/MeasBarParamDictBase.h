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
@class ModeParamDictBase;

@interface MeasBarParamDictBase : ParamDictBase

@property (nonatomic) MeasureBase *measure;

@property (nonatomic) ModeParamDictBase *modePar;

-(void)parseBar0Parameters;
-(void)parseBar1Parameters;
-(void)parseBar2Parameters;
-(void)parseBar3Parameters;
-(void)parseBar4Parameters;
-(void)parseBar5Parameters;
-(void)parseBar6Parameters;
-(void)parseBar7Parameters;
-(void)parseBar8Parameters;
-(void)parseBar9Parameters;

@end