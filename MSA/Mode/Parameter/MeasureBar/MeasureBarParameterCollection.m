//
//  MeasureBarParameterCollection.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureBarParameterCollection.h"

@interface MeasureBarParameterCollection()

@end

@implementation MeasureBarParameterCollection

+ (id)parameterCollection
{
    static id parCollection = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        parCollection = [[self alloc] init];
    });
    
    return parCollection;
}

-(id) init {
    if ((self = [super init]))
    {
    }
    
    return self;
}

-(void)registerParameterEvent
{
    
}

-(void)unregisterParameterEvent
{
    
}

@end
