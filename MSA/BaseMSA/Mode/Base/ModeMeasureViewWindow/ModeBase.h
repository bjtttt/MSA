//
//  ModeBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeasureBase;
@class ShareSettings;
@class ModeParamDictBase;

@interface ModeBase : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) NSString *modeName;
@property (nonatomic) NSMutableDictionary *measureDict;

@property (nonatomic) MeasureBase *curMeasure;
@property (nonatomic) MeasureBase *prevMeasure;

@property (nonatomic) ModeParamDictBase *modeParDict;

-(void)switchMeasurement:(MeasureBase *)curMeas;

-(void)initMode;
-(void)initMeasurement;

-(id)initWithConfig:(ShareSettings *)ss;

@end