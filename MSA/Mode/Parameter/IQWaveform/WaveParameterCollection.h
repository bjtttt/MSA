//
//  WaveParameterCollection.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;

@interface WaveParameterCollection : NSObject

+(id)parameterCollection;

@property (nonatomic) ShareSettings *shareSettings;

-(void)registerParameterEvent;
-(void)unregisterParameterEvent;
-(void)parseParameter;

@end