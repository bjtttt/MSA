//
//  ModeBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeasureBase;

@interface ModeBase : NSObject

@property (nonatomic) NSMutableString *modeName;
@property (nonatomic) NSMutableDictionary *measureDict;

@property (nonatomic) MeasureBase *curMeasure;

-(void)switchMeasurement:(MeasureBase *)curMeas;

@end