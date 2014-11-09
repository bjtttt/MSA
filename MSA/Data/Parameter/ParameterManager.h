//
//  ParameterManager.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModeParameterCollection;
@class ShareSettings;

@interface ParameterManager : NSObject

@property (strong, nonatomic) ModeParameterCollection *modeParCol;

+ (id)parameterManager;

@property (nonatomic) ShareSettings *shareSettings;

-(void) registerParameterChangedEvent;
-(void) unregisterParameterChangedEvent;

@end