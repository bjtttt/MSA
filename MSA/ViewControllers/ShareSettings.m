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

+ (id)sharedSettings
{
    static id shareSettings = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shareSettings = [[self alloc] init];
    });
    
    return shareSettings;
}

-(UIImage *)screenShot:(UIViewController *) uiVC saveInAlbum:(BOOL)saveInAlbum {
    NSLog(@"Screeen UIViewController View Bounds X %f, Y %f, Width %f, Height %f", uiVC.view.bounds.origin.x, uiVC.view.bounds.origin.y, uiVC.view.bounds.size.width, uiVC.view.bounds.size.height);

    UIGraphicsBeginImageContext(uiVC.view.bounds.size);
    
    BOOL ret = [uiVC.view drawViewHierarchyInRect:uiVC.view.bounds afterScreenUpdates:YES];
    //[uiVC.view snapshotViewAfterScreenUpdates:YES];
    
    if(ret == NO)
        NSLog(@"Screen Snapshot fails.");
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    /*
    UIGraphicsBeginImageContext(uiVC.view.bounds.size);
    [uiVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */
    
    /*
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(uiVC.view.window.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(uiVC.view.window.bounds.size);
    [uiVC.view.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */
    
    /*
    UIGraphicsBeginImageContext(uiVC.view.bounds.size);
    NSLog(@"Screen Image View Bounds X %f, Y %f, Width %f, Height %f", uiVC.view.bounds.origin.x, uiVC.view.bounds.origin.y, uiVC.view.bounds.size.width, uiVC.view.bounds.size.height);
    NSLog(@"Screen Image View Layer Bounds Layer X %f, Y %f, Width %f, Height %f", uiVC.view.layer.bounds.origin.x, uiVC.view.layer.bounds.origin.y, uiVC.view.layer.bounds.size.width, uiVC.view.layer.bounds.size.height);
    
    [uiVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */
    
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

    /*
    if ((blur < 0.1f) || (blur > 2.0f)) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    NSLog(@"boxSize:%i",boxSize);
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
    */
}

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

-(CGFloat) measureBarPopupMenuPosition:(NSInteger)index forWidth:(CGFloat)width
{
    NSAssert(index >= -1 && index < self.measureBarCount, @"Index is %ld.", (long)index);
    NSAssert(width >= 0.0, @"Width is %f.", width);
    
    if(index == -1)
        index = 0;
    
    if(self.useBarRatio == YES)
    {
        CGFloat ratios = 0.0;
        CGFloat wholeRatios = 0.0;
        for (NSInteger i=0;i<self.measureBarCount;i++)
        {
            if(i < index)
                ratios = ratios + [[self.barWidths objectAtIndex:i] floatValue];
            wholeRatios = wholeRatios + [[self.barWidths objectAtIndex:i] floatValue];
        }
        
        return width * ratios / wholeRatios;
    }
    else
    {
        CGFloat ratios = 0.0;
        for (NSInteger i=0;i<index;i++)
        {
            ratios = ratios + [[self.barWidths objectAtIndex:i] floatValue];
        }
        
        return ratios;
    }
}

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
        
        MeasureBarDetail *mbd = [[MeasureBarDetail alloc] init];
        mbd.measure = [[NSMutableString alloc] initWithString:sKey];
        mbd.useRatio = useRatio;
        mbd.mbarCount = normalCount;
        mbd.mbarWidths = [[NSMutableArray alloc] initWithArray:normalWidth];
        float totalWidth = 0.0;
        for (int i = 0; i < defCount ; i++)
        {
            totalWidth = totalWidth + [[mbd.mbarWidths objectAtIndex:i] floatValue];
        }
        mbd.totalWidth = totalWidth;
        mbd.mbarSmallWidths = [[NSMutableArray alloc] initWithArray:smallWidth];
        totalWidth = 0.0;
        for (int i=0;i<defCount;i++)
        {
            totalWidth = totalWidth + [[mbd.mbarSmallWidths objectAtIndex:i] floatValue];
        }
        mbd.totalSmallWidth = totalWidth;
       [self.mbarDetails addObject:mbd];

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

-(void)switchMeasure:(NSString *)curMeas
{
    self.prevMeasure = self.curMeasure;
    self.curMeasure = [[NSMutableString alloc] initWithString:curMeas];
    
    MeasureBarDetail *mbd = nil;
    for (id mbdi in self.mbarDetails)
    {
        if([((MeasureBarDetail *)mbdi).measure isEqualToString:curMeas])
        {
            mbd = mbdi;
            break;
        }
    }
    
    self.measureBarCount = mbd.mbarCount;
    self.barWidths = mbd.mbarWidths;
    self.barSmallWidths = mbd.mbarSmallWidths;
    self.totalBarWidth = mbd.totalWidth;
    self.totalBarSmallWidth = mbd.totalSmallWidth;
}

@end

