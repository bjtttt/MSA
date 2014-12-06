//
//  ParameterManager.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModeParams;
@class ShareSettings;

@interface ParameterManager : NSObject

@property (strong, nonatomic) ModeParams *modePars;

@property (nonatomic) ShareSettings *shareSettings;

-(void)registerParameterChangedEvent;
-(void)unregisterParameterChangedEvent;
-(void)parseParameter;

-(instancetype)initWithConfig:(ShareSettings *)ss NS_DESIGNATED_INITIALIZER;

@end