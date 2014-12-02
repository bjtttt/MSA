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

@interface ModeManager : NSObject

@property (nonatomic) Mode *mode;
@property (nonatomic) MeasureBase *measure;

@property (nonatomic) ShareSettings *shareSettings;

-(void)initMode;

@end