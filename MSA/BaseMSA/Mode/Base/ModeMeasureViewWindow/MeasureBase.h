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

@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar0Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar1Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar2Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar3Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar4Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar5Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar6Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar7Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar8Menu;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UISoftPanel *setupMeasureBar9Menu;

-(CGFloat)measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width;

-(instancetype)initWithConfig:(ShareSettings *)ss NS_DESIGNATED_INITIALIZER;

@end