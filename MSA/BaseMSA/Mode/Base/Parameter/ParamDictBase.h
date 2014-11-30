//
//  ParamDictBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(int, ParamDictType) {
    MODE_DICT = 0,
    MEAS_DICT,
    MBAR_DICT
};

@class ShareSettings;
@class Parameter;

@interface ParamDictBase : NSObject

@property (nonatomic) ParamDictType dictType;

@property (nonatomic, readonly) NSMutableString *modeName;
@property (nonatomic, readonly) NSMutableString *measName;

@property (nonatomic) NSMutableDictionary *parDict;
@property (nonatomic) ShareSettings *shareSettings;

-(void)registerParameterEvent;
-(void)unregisterParameterEvent;
-(void)parseParameter;

-(void)addParameter:(Parameter *)par forKey:(NSString *)key;
-(Parameter *)getParameterBy:(NSString *)key;

@end