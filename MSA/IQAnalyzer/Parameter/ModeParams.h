//
//  ModeParams.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeParamDictBase.h"

@class SpecParams;
@class WaveParams;
@class ShareSettings;

@interface ModeParams : ModeParamDictBase

@property (nonatomic) SpecParams * specParams;
@property (nonatomic) WaveParams * waveParams;

@end