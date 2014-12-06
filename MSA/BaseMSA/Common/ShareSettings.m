//
//  ShareSettings.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-27.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "UIKeyMeasure.h"
#import "UIKeyView.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import "GPUImageiOSBlurFilter.h"
#import "UISoftMenu.h"
#import "UISoftPanel.h"
#import "UISoftKey.h"
#import "UISoftKeyEnum.h"
#import "UISoftKeyEnumItem.h"
#import "MeasureBarDetail.h"

@implementation ShareSettings

-(UIImage *)screenShot:(UIViewController *) uiVC saveInAlbum:(BOOL)saveInAlbum {
    NSLog(@"Screeen UIViewController View Bounds X %f, Y %f, Width %f, Height %f", uiVC.view.bounds.origin.x, uiVC.view.bounds.origin.y, uiVC.view.bounds.size.width, uiVC.view.bounds.size.height);

    UIGraphicsBeginImageContext(uiVC.view.bounds.size);
    
    BOOL ret = [uiVC.view drawViewHierarchyInRect:uiVC.view.bounds afterScreenUpdates:YES];
    
    if(ret == NO)
        NSLog(@"Screen Snapshot fails.");
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(saveInAlbum == YES)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil); //if you need to save
    
    return image;
}

-(UIImage *)blurryImage:(UIImage *)image {
    // Create filter.
    if(self.blurFilter == nil)
    {
        self.blurFilter = [GPUImageiOSBlurFilter new];
        self.blurFilter.blurRadiusInPixels = 1.0f;
        self.blurFilter.saturation = 1.0f;
        self.blurFilter.downsampling = 1.0f;
    }
    
    // Apply filter.
    UIImage *blurredImage = [self.blurFilter imageByFilteringImage:image];
    
    return blurredImage;
}

/* Should be removed
- (void) initMeasureView
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Mode" ofType:@"plist"];
   
    NSDictionary *modeInfo = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *measViewInfos = [modeInfo objectForKey:@"measure"];
    
    self.measureView = [[NSMutableArray alloc] init];
    for(NSString *measKey in measViewInfos)
    {
        NSDictionary *measInfo = [measViewInfos objectForKey:measKey];
        UIKeyMeasure *meas = [[UIKeyMeasure alloc] init];
        meas.name = [[NSMutableString alloc] initWithString:measKey];
        meas.nameDisplay = [[NSMutableString alloc] initWithString:(NSString *)[measInfo objectForKey:@"display"]];
        meas.isDefault = [[measInfo objectForKey:@"isDefault"] boolValue];
        meas.enabled = [[measInfo objectForKey:@"enabled"] boolValue];
        
        NSDictionary *viewInfos = (NSDictionary *)[measInfo objectForKey:@"View"];
        for(NSString *viewKey in viewInfos)
        {
            NSDictionary *viewInfo = [viewInfos objectForKey:viewKey];
            UIKeyView *view = [[UIKeyView alloc] init];
            view.name = [[NSMutableString alloc] initWithString:viewKey];
            view.name = [[NSMutableString alloc] initWithString:(NSString *)[viewInfo objectForKey:@"display"]];
            view.isDefault = [[viewInfo objectForKey:@"isDefault"] boolValue];
            view.enabled = [[viewInfo objectForKey:@"enabled"] boolValue];
            
            [meas.views addObject:view];
        }
        
        [self.measureView addObject:meas];
    }
}
*/

/*
- (void) initMeasureBar
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Mode" ofType:@"plist"];
    
    NSDictionary *modeInfo = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *settingsInfo = [modeInfo objectForKey:@"settings"];
    NSArray *measBarPanels = [modeInfo objectForKey:@"measureBar"];
    
    NSDictionary *settingsMeasureBar = (NSDictionary *)[settingsInfo objectForKey:@"measureBar"];
    
    //self.measureBarCount = (int)measBarPanels.count;
    
    self.useBarRatio = [[settingsMeasureBar objectForKey:@"useRatio"] boolValue];
    NSDictionary *widthsDict = [settingsMeasureBar objectForKey:@"widths"];

    for(NSString *sKey in [settingsMeasureBar allKeys])
    {
        NSString *sVal = (NSString *)[widthsDict objectForKey:sKey];
        //NSLog(@"Key:%@,Value:%@",key,[requestData objectForKey:key]);
        
        NSAssert(sKey != nil, @"Measure Bar Width : measure is nil.");
        NSAssert(sKey.length > 0, @"Measure Bar WIdth : measure is empty.");
        
        MeasureBarDetail *mbd = [[MeasureBarDetail alloc] init];
        mbd.measure = [[NSMutableString alloc] initWithString:sKey];
        
        
    }
*/
    /*
    self.barWidths = [[NSMutableArray alloc] initWithArray:(NSArray *)[settingsMeasureBar objectForKey:@"width"]];
    if(self.barWidths != nil)
    {
        NSAssert((int)self.barWidths.count == 0 || (int)self.barWidths.count == self.measureBarCount, @"The count of the Bar Width is %u not %d.", (int)self.barWidths.count, (int)self.measureBarCount);
        if(self.barWidths.count != 0)
        {
            for(int i=0;i<self.measureBarCount;i++)
            {
                NSLog(@"Bar Width : %d - %f", i, [[self.barWidths objectAtIndex:0] floatValue]);
                NSAssert([[self.barWidths objectAtIndex:i] floatValue] >= 0.0f, @"The %d Bar Width is %f.", i, [[self.barWidths objectAtIndex:i] floatValue]);
            }
        }
        else
        {
            self.barWidths = [[NSMutableArray alloc] initWithCapacity:self.measureBarCount];
            NSLog(@"Initiate each Bar Width to be equal.");
            for(int i=0;i<self.measureBarCount;i++)
            {
                [self.barWidths insertObject:@1.0 atIndex:i];
            }
        }
    }
    else
    {
        self.barWidths = [[NSMutableArray alloc] initWithCapacity:self.measureBarCount];
        NSLog(@"Initiate each Bar Width to be equal.");
        for(int i=0;i<self.measureBarCount;i++)
        {
            [self.barWidths insertObject:@1.0 atIndex:i];
        }
    }
    
    CGFloat totalWidth = 0.0;
    for(int i=0;i<self.measureBarCount;i++)
    {
        totalWidth = totalWidth + [[self.barWidths objectAtIndex:i] floatValue];
    }
    self.totalBarWidth = totalWidth;
    */
/*
}
*/

/* Should be removed
-(void)initSoftMenuSystem
{
    self.softMenuDict=[[NSMutableDictionary alloc] init];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Mode" ofType:@"plist"];
    
    NSDictionary *modeInfo = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *measBarDict = [modeInfo objectForKey:@"measureBar"];
    
    for(NSString *sKey in [measBarDict allKeys])
    {
        NSDictionary *sVal = (NSDictionary *)[measBarDict objectForKey:sKey];
        
        UISoftMenu *sMenu = [[UISoftMenu alloc] init];
        [self.softMenuDict setValue:sMenu forKey:sKey];
        
        sMenu.shareSettings = self;
        
        NSArray *definition = [sVal objectForKey:@"definition"];
        NSDictionary *widthDict = [sVal objectForKey:@"width"];
        
        NSAssert(definition != nil, @"%@ measure bar definition is nil.", sKey);
        NSAssert(widthDict != nil, @"%@ measure bar width is nil.", sKey);
        
        int defCount = (int)definition.count;
        bool useRatio = (bool)[widthDict objectForKey:@"useRatio"];
        NSArray *normalWidth = (NSArray *)[widthDict objectForKey:@"normal"];
        NSArray *smallWidth = (NSArray *)[widthDict objectForKey:@"small"];
        
        int normalCount = (int)normalWidth.count;
        int smallCount = (int)smallWidth.count;
        
        NSAssert(defCount == normalCount && defCount == smallCount, @"Measure bar definition %d, normal count %d, small count %d", defCount, normalCount, smallCount);
        
        for(int i = 0; i < defCount; i++)
        {
            NSArray *measBar=[definition objectAtIndex:i];
            UISoftPanel *softPanel=[[UISoftPanel alloc] init];
            NSMutableString *spTitle = [[NSMutableString alloc] initWithString:@""];
            [spTitle appendFormat:@"Measure Bar %d", i];
            softPanel.title=spTitle;
            [sMenu.measBarPanels addObject:softPanel];
            
            int count = (int)measBar.count;
            for(int index = 0; index < count; index++)
            {
                NSDictionary *measBarItem=[measBar objectAtIndex:index];
                
                UISoftKey *softKey = [[UISoftKey alloc] init];
                softKey.softPanel=softPanel;
                [softPanel.keyArray addObject:softKey];
                
                NSString *stringItem;
                stringItem = [measBarItem objectForKey:@"label"];
                if(stringItem == nil)
                    softKey.label=[[NSMutableString alloc] initWithString:@""];
                else
                    softKey.label=[[NSMutableString alloc] initWithString:stringItem];
                stringItem = [measBarItem objectForKey:@"labelShort"];
                if(stringItem == nil)
                    softKey.labelShort=[[NSMutableString alloc] initWithString:@""];
                else
                    softKey.labelShort=[[NSMutableString alloc] initWithString:stringItem];
                stringItem = [measBarItem objectForKey:@"nameString"];
                if(stringItem == nil)
                    softKey.nameString=[[NSMutableString alloc] initWithString:@""];
                else
                    softKey.nameString=[[NSMutableString alloc] initWithString:stringItem];
                softKey.valueTypeInteger=[[measBarItem objectForKey:@"type"] intValue];
                softKey.value=[measBarItem objectForKey:@"value"];
                softKey.valueString=[measBarItem objectForKey:@"valueString"];
                softKey.unit=[measBarItem objectForKey:@"unit"];
                
                NSArray *enumArray=[measBarItem objectForKey:@"enumValues"];
                if(enumArray != nil)
                {
                    [softKey initSoftKeyEnum];
                    int enumArrayCount = (int)enumArray.count;
                    for(int j = 0; j < enumArrayCount; j++)
                    {
                        NSDictionary *enumItem=[enumArray objectAtIndex:j];
                        int enumItemValue=[[enumItem objectForKey:@"value"] intValue];
                        NSString *enumItemLabel=[enumItem objectForKey:@"label"];
                        NSString *enumItemLabelShort=[enumItem objectForKey:@"labelShort"];
                        
                        [softKey addSoftkeyEnumItem:enumItemValue label:enumItemLabel labelShort:enumItemLabelShort];
                    }
                }
                
                NSDictionary *subMeasBarItem = [measBarItem objectForKey:@"subBoolEnum"];
                if(subMeasBarItem != nil)
                {
                    UISoftKey *subSoftKey = [[UISoftKey alloc] init];
                    softKey.subSoftkey = subSoftKey;
                    subSoftKey.parentSoftkey = softKey;
                    subSoftKey.softPanel = softPanel;
                    
                    stringItem = [subMeasBarItem objectForKey:@"nameString"];
                    if(stringItem == nil)
                        subSoftKey.nameString=[[NSMutableString alloc] initWithString:@""];
                    else
                        subSoftKey.nameString=[[NSMutableString alloc] initWithString:stringItem];
                    subSoftKey.valueTypeInteger=[[subMeasBarItem objectForKey:@"type"] intValue];
                    
                    NSAssert(subSoftKey.valueType == VAL_BOOL_ONOFF || subSoftKey.valueType == VAL_BOOL_AUTOMAN || subSoftKey.valueType == VAL_ENUM, @"UISoftKey %@ has sub UISoftKey type %d", softKey.label, subSoftKey.valueTypeInteger);
                    
                    subSoftKey.value=[subMeasBarItem objectForKey:@"value"];

                    enumArray=[subMeasBarItem objectForKey:@"enumValues"];
                    if(enumArray != nil)
                    {
                        [subSoftKey initSoftKeyEnum];
                        int enumArrayCount = (int)enumArray.count;
                        for(int j=0;j<enumArrayCount;j++)
                        {
                            NSDictionary *enumItem=[enumArray objectAtIndex:j];
                            int enumItemValue=[[enumItem objectForKey:@"value"] intValue];
                            NSString *enumItemLabel=[enumItem objectForKey:@"label"];
                            NSString *enumItemLabelShort=[enumItem objectForKey:@"labelShort"];
                            
                            [subSoftKey addSoftkeyEnumItem:enumItemValue label:enumItemLabel labelShort:enumItemLabelShort];
                        }
                    }
                    else
                    {
                        NSAssert(enumArray != nil, @"UISoftKey %@ has sub UISoftKey with nil Enum", softKey.label);
                    }
                }
            }
        }
    }
}
*/

-(void)valueTouching:(id)parameter
{
    
}

-(void)valueChanging:(id)parameter
{
    
}

-(void)valueChanged:(id)parameter
{
    
}

-(NSString *)convertFrequency:(double)dbFreq
{
    bool isNeg = false;
    if(dbFreq < 0.0)
    {
        isNeg = true;
        dbFreq = -dbFreq;
    }
    
    NSMutableString *msv = nil;
    if(dbFreq > 1.0e9)
    {
        dbFreq = dbFreq / 1.0e9;
        msv = [[@(dbFreq) stringValue] mutableCopy];
        [msv appendString:@" G"];
    }
    else if(dbFreq > 1.0e6)
    {
        dbFreq = dbFreq / 1.0e6;
        msv = [[@(dbFreq) stringValue] mutableCopy];
        [msv appendString:@" M"];
    }
    else if(dbFreq > 1.0e3)
    {
        dbFreq = dbFreq / 1.0e3;
        msv = [[@(dbFreq) stringValue] mutableCopy];
        [msv appendString:@" k"];
    }
    else
    {
        msv = [[@(dbFreq) stringValue] mutableCopy];
        [msv appendString:@" "];
    }

    if(isNeg)
        [msv insertString:@"-" atIndex:0];
    return (NSString *)msv;
}

-(NSString *)convertTime:(double)dbTime
{
    bool isNeg = false;
    if(dbTime < 0.0)
    {
        isNeg = true;
        dbTime = -dbTime;
    }
    
    NSMutableString *msv = nil;
    if(dbTime > 1.0e3)
    {
        dbTime = dbTime / 1.0e3;
        msv = [[@(dbTime) stringValue] mutableCopy];
        [msv appendString:@" k"];
    }
    else if(dbTime > 1.0)
    {
        msv = [[@(dbTime) stringValue] mutableCopy];
        [msv appendString:@" "];
    }
    else if(dbTime > 1.0e-3)
    {
        dbTime = dbTime * 1.0e3;
        msv = [[@(dbTime) stringValue] mutableCopy];
        [msv appendString:@" m"];
    }
    else if(dbTime > 1.0e-6)
    {
        dbTime = dbTime * 1.0e6;
        msv = [[@(dbTime) stringValue] mutableCopy];
        [msv appendString:@" u"];
    }
    else if(dbTime > 1.0e-9)
    {
        dbTime = dbTime * 1.0e9;
        msv = [[@(dbTime) stringValue] mutableCopy];
        [msv appendString:@" n"];
    }
    else
    {
        msv = [[@(dbTime) stringValue] mutableCopy];
        [msv appendString:@" "];
    }

    if(isNeg)
        [msv insertString:@"-" atIndex:0];
    return (NSString *)msv;
}

@end

