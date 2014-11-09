//
//  ModeParameterCollection.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpecParameterCollection;
@class WaveParameterCollection;
@class MeasureBarParameterCollection;
@class ShareSettings;

@interface ModeParameterCollection : NSObject

+(id)parameterCollection;

@property (nonatomic) SpecParameterCollection * specParCol;
@property (nonatomic) WaveParameterCollection * waveParCol;
@property (nonatomic) MeasureBarParameterCollection * mbarParCol;

@property (nonatomic) ShareSettings *shareSettings;

-(void)registerParameterEvent;
-(void)unregisterParameterEvent;
-(void)parseParameter;

@end