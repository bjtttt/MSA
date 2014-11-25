//
//  ModeParameterCollection.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpecParams;
@class WaveParams;
@class ShareSettings;

@interface ModeParameterCollection : NSObject

@property (nonatomic) SpecParams * specParams;
@property (nonatomic) WaveParams * waveParams;

@property (nonatomic) ShareSettings *shareSettings;

-(void)registerParameterEvent;
-(void)unregisterParameterEvent;
-(void)parseParameter;

@end