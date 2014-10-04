//
//  ParameterManager.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

@class ParameterCollection;

@interface ParameterManager : NSObject

@property (strong, nonatomic) ParameterCollection *parCol;

+ (id)parameterManager;

-(void) registerParameterChangedEvent;
-(void) unregisterParameterChangedEvent;

@end