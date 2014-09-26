//
//  UIKeyMeasure.h
//  MSA
//
//  Created by GUO Zhitao on 25/09/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_UIKeyMeasure_h
#define MSA_UIKeyMeasure_h

#import "ShareSettings.h"

@interface UIKeyMeasure : NSObject

@property (nonatomic) NSMutableString *name;
@property (nonatomic) BOOL enabled;

@property (nonatomic) NSMutableArray *views;

@end

#endif
