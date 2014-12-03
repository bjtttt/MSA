//
//  ModeManager.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Mode;
@class ShareSettings;
@class MeasureBase;
@class MeasureBarDetail;

@interface ModeManager : NSObject

@property (nonatomic) Mode *mode;
@property (nonatomic, readonly) MeasureBase *prevMeasure;
@property (nonatomic, readonly) MeasureBase *curMeasure;
@property (nonatomic, readonly) MeasureBarDetail *curMBarDetail;

@property (nonatomic) ShareSettings *shareSettings;

-(void)initMode;

-(id)initWithConfig:(ShareSettings *)ss;

@end