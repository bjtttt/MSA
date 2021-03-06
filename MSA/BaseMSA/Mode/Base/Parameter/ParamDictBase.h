//
//  ParamDictBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShareSettings.h"

@class Parameter;

@interface ParamDictBase : NSObject

@property (nonatomic) ParamDictType dictType;
@property (nonatomic) NSMutableDictionary *parDict;
@property (nonatomic) ShareSettings *shareSettings;

-(void)registerParameterEvent;
-(void)unregisterParameterEvent;
-(void)parseParameter;

-(void)addParameter:(Parameter *)par forKey:(NSString *)key;
-(Parameter *)getParameterBy:(NSString *)key;
-(bool)checkParameterBy:(NSString *)key;

-(instancetype)initWithConfig:(ShareSettings *)ss NS_DESIGNATED_INITIALIZER;

@end