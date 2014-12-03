//
//  MeasureBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UISoftMenu;
@class UISoftPanel;
@class ViewBase;
@class MeasureBarDetail;
@class ShareSettings;
@class MeasParamDictBase;

@interface MeasureBase : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) NSString *measureName;

@property (nonatomic) MeasureBarDetail *mbarDetail;
@property (nonatomic) MeasParamDictBase *measParDict;

@property (nonatomic) ViewBase *curView;
@property (nonatomic) NSMutableDictionary *viewDict;

@property (nonatomic) UISoftMenu *barMenu;
@property (nonatomic) UISoftMenu *softMenu;

-(void)initMeasureMent;
-(void)initMeasureBarMenu;
-(void)initMeasureSoftMenu;
-(void)initMeasureView;
-(void)initMeasBarDetail;

-(UISoftPanel *)setupMeasureBar0Menu;
-(UISoftPanel *)setupMeasureBar1Menu;
-(UISoftPanel *)setupMeasureBar2Menu;
-(UISoftPanel *)setupMeasureBar3Menu;
-(UISoftPanel *)setupMeasureBar4Menu;
-(UISoftPanel *)setupMeasureBar5Menu;
-(UISoftPanel *)setupMeasureBar6Menu;
-(UISoftPanel *)setupMeasureBar7Menu;
-(UISoftPanel *)setupMeasureBar8Menu;
-(UISoftPanel *)setupMeasureBar9Menu;

-(CGFloat)measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width;

-(id)initWithConfig:(ShareSettings *)ss;

@end