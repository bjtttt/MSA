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

-(instancetype) init
{    
    [NSException raise:@"MeasureBase::init" format:@"Call MeasureBase::initWithConfig: instead"];
    
    return nil;
}

-(instancetype) initWithConfig:(ShareSettings *)ss {
    if ((self = [super init]))
    {
        _shareSettings = ss;
        _viewDict = [[NSMutableDictionary alloc] init];
        _barMenu = [[UISoftMenu alloc] initWithConfig:ss];
        _softMenu = [[UISoftMenu  alloc] initWithConfig:ss];
        _mbarDetail = [[MeasureBarDetail alloc] init];
    }
    
    return self;
}

-(void)initMeasureMent
{
    [self initMeasBarDetail];
    [self initMeasureBarMenu];
    [self initMeasureSoftMenu];
    [self initMeasureView];
}

-(void)initMeasureBarMenu
{
    UISoftPanel *uiSP = [self setupMeasureBar0Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar1Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar2Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar3Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar4Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar5Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar6Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar7Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar8Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
    uiSP = [self setupMeasureBar9Menu];
    if(uiSP != nil)
        [_barMenu.measBarPanels addObject:uiSP];
}

-(void)initMeasureSoftMenu
{
    [NSException raise:@"MeasureBase::initMeasureSoftMenu" format:@"MeasureBase::initMeasureSoftMenu should be override in each mode."];
}

-(void)initMeasureView
{
    [NSException raise:@"MeasureBase::initMeasureView" format:@"MeasureBase::initMeasureView should be override in each mode."];
}

-(void)initMeasBarDetail
{
    [NSException raise:@"MeasureBase::initMeasBarDetail" format:@"MeasureBase::initMeasBarDetail should be override in each mode."];
}

-(CGFloat)measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width
{
    if(index <= 0 && index >= self.mbarDetail.mbarCount)
        [NSException raise:@"MeasureBase::measureBarPopupMenuPosition:forWidth:" format:@"Index is %d.", index];
    if(width < 0.0)
        [NSException raise:@"MeasureBase::measureBarPopupMenuPosition:forWidth:" format:@"Width is %f.", width];
    
    if(index == -1)
        index = 0;
    
    if(self.mbarDetail.useRatio == YES)
    {
        if(_shareSettings.curDispType == UIDT_MENU || _shareSettings.curDispType == UIDT_MENU_BARPOPUP ||
           _shareSettings.curDispType == UIDT_MENU_BARPOPUP_INPUT || _shareSettings.curDispType == UIDT_MENU_INPUT ||
           _shareSettings.curDispType == UIDT_MENU_PRESET)
            return width * [self.mbarDetail.mbarSmallWidths[index] floatValue] / self.mbarDetail.totalSmallWidth;
        else
            return width * [self.mbarDetail.mbarWidths[index] floatValue] / self.mbarDetail.totalWidth;
    }
    else
    {
        CGFloat xPos = 0.0;
        for (NSInteger i=0;i<index;i++)
        {
            if(_shareSettings.curDispType == UIDT_MENU || _shareSettings.curDispType == UIDT_MENU_BARPOPUP ||
               _shareSettings.curDispType == UIDT_MENU_BARPOPUP_INPUT || _shareSettings.curDispType == UIDT_MENU_INPUT ||
               _shareSettings.curDispType == UIDT_MENU_PRESET)
                xPos = xPos + [self.mbarDetail.mbarSmallWidths[i] floatValue];
            else
                xPos = xPos + [self.mbarDetail.mbarWidths[i] floatValue];
        }
        
        return xPos;
    }
}

-(UISoftPanel *)setupMeasureBar0Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar0Menu" format:@"MeasureBase::setupMeasureBar0Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar1Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar1Menu" format:@"MeasureBase::setupMeasureBar1Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar2Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar2Menu" format:@"MeasureBase::setupMeasureBar2Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar3Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar3Menu" format:@"MeasureBase::setupMeasureBar3Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar4Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar4Menu" format:@"MeasureBase::initMeasureBar4Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar5Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar5Menu" format:@"MeasureBase::setupMeasureBar5Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar6Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar6Menu" format:@"MeasureBase::setupMeasureBar6Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar7Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar7Menu" format:@"MeasureBase::setupMeasureBar7Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar8Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar8Menu" format:@"MeasureBase::setupMeasureBar8Menu should be override in each mode."];
    
    return nil;
}

-(UISoftPanel *)setupMeasureBar9Menu
{
    [NSException raise:@"MeasureBase::setupMeasureBar9Menu" format:@"MeasureBase::setupMeasureBar9Menu should be override in each mode."];
    
    return nil;
}

@end
