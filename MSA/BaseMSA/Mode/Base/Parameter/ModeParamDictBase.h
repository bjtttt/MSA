//
//  ModeParamDictBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParamDictBase.h"

@class ModeBase;
@class MeasParamDictBase;

@interface ModeParamDictBase : ParamDictBase

@property (nonatomic) ModeBase *mode;

@property (nonatomic) NSMutableArray *measParArray;

-(void)addMeasurePar:(MeasParamDictBase *)measPar;

@end