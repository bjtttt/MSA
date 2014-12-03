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
@class MeasureBase;
@class MeasParamDictBase;

@interface ModeParamDictBase : ParamDictBase

@property (nonatomic) ModeBase *mode;
@property (nonatomic) NSMutableDictionary *measParDict;

-(void)addMeasurePar:(MeasParamDictBase *)measPar forKey:(NSString *)key;
-(MeasParamDictBase *)getMeasureParByKey:(NSString *)key;
-(bool)checkMeasureParByKey:(NSString *)key;

@end