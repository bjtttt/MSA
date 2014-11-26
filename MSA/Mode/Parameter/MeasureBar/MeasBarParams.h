//
//  MeasBarParams.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;
@class MeasureBarDetail;

@interface MeasBarParams : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) NSMutableDictionary *mbarParamDict;

@property (nonatomic) MeasureBarDetail *mbarDetail;

-(void)registerParameterEvent;
-(void)unregisterParameterEvent;
-(void)parseParameter;

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

-(void)initMeasBarDetail;
-(void)setBarWidth;

@end