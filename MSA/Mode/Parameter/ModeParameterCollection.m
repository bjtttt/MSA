//
//  ModeParameterCollection.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModeParameterCollection.h"

@interface ModeParameterCollection()

@end

@implementation ModeParameterCollection

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

@end
