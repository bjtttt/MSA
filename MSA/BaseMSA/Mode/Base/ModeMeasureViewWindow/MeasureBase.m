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
#import "MeasureBarDetail.h"
#import "ShareSettings.h"

@interface MeasureBase()

@end

@implementation MeasureBase

-(id) init {
    if ((self = [super init]))
    {
        self.viewDict = [[NSMutableDictionary alloc] init];
        self.barMenu = [[UISoftMenu alloc] init];
        self.softMenu = [[UISoftMenu  alloc] init];
        self.mbarDetail = [[MeasureBarDetail alloc] init];
    }
    
    return self;
}

-(void)initMeasureMent
{
    [self initMeasureBarMenu];
    [self initMeasureSoftMenu];
    [self initMeasureView];
    [self initMeasBarDetail];
}

-(void)initMeasureBarMenu
{
    UISoftPanel *uiSP = [self setupMeasureBar0Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar1Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar2Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar3Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar4Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar5Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar6Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar7Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar8Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar9Menu];
    if(uiSP != nil)
        [self.barMenu.measBarPanels addObject:uiSP];
}

-(void)initMeasureSoftMenu
{
    NSAssert(YES==NO, @"MeasureBase::initMeasureSoftMenu should be override in each mode.");
}

-(void)initMeasureView
{
    NSAssert(YES==NO, @"MeasureBase::initMeasureView should be override in each mode.");
}

-(void)initMeasBarDetail
{
    NSAssert(YES==NO, @"MeasureBase::initMeasBarDetail should be override in each mode.");
}

-(CGFloat)measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width
{
    NSAssert(index >= -1 && index < self.mbarDetail.mbarCount, @"Index is %ld.", (long)index);
    NSAssert(width >= 0.0, @"Width is %f.", width);
    
    if(index == -1)
        index = 0;
    
    if(self.mbarDetail.useRatio == YES)
    {
        if(self.shareSettings.menuDisplayed == YES)
            return width * [self.mbarDetail.mbarSmallWidths[index] floatValue] / self.mbarDetail.totalSmallWidth;
        else
            return width * [self.mbarDetail.mbarWidths[index] floatValue] / self.mbarDetail.totalWidth;
    }
    else
    {
        CGFloat xPos = 0.0;
        for (NSInteger i=0;i<index;i++)
        {
            if(self.shareSettings.menuDisplayed == YES)
                xPos = xPos + [self.mbarDetail.mbarSmallWidths[i] floatValue];
            else
                xPos = xPos + [self.mbarDetail.mbarWidths[i] floatValue];
        }
        
        return xPos;
    }
}

-(UISoftPanel *)setupMeasureBar0Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar0Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar1Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar1Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar2Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar2Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar3Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar3Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar4Menu
{
    NSAssert(YES==NO, @"MeasureBase::initMeasureBar4Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar5Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar5Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar6Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar6Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar7Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar7Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar8Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar8Menu should be override in each mode.");
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar9Menu
{
    NSAssert(YES==NO, @"MeasureBase::setupMeasureBar9Menu should be override in each mode.");
    
    return nil;
}

@end
