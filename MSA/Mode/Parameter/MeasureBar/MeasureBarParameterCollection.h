//
//  MeasureBarParameterCollection.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;

@interface MeasureBarParameterCollection : NSObject

+(id)parameterCollection;

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) NSDictionary *parDict;

-(void)registerParameterEvent;
-(void)unregisterParameterEvent;
-(void)parseParameter;

@end