//
//  MeasureBase.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureBase.h"
#import "UISoftMenu.h"

@interface MeasureBase()

@end

@implementation MeasureBase

-(id) init {
    if ((self = [super init]))
    {
        self.viewDict = [[NSMutableDictionary alloc] init];
        self.barMenu = [[UISoftMenu alloc] init];
        self.softMenu = [[UISoftMenu  alloc] init];
    }
    
    return self;
}

-(void)initMeasureBarMenu
{
    NSAssert(YES==NO, @"MeasureBase::initMeasureBarMenu should be override in each mode.");
}

-(void)initMeasureSoftMenu
{
    NSAssert(YES==NO, @"MeasureBase::initMeasureSoftMenu should be override in each mode.");
}

-(void)initMeasureView
{
    NSAssert(YES==NO, @"MeasureBase::initMeasureView should be override in each mode.");
}

@end
