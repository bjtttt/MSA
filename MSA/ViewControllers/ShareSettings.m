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
        [meas.name replaceOccurrencesOfString:@"\\n" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [meas.name length])];
        meas.enabled = [[measInfo objectForKey:@"Enabled"] boolValue];
        
        NSDictionary *viewInfos = (NSDictionary *)[measInfo objectForKey:@"View"];
        for(NSString *viewKey in viewInfos)
        {
            NSDictionary *viewInfo = [viewInfos objectForKey:viewKey];
            UIKeyView *view = [[UIKeyView alloc] init];
            view.name = [[NSMutableString alloc] initWithString:viewKey];
            [view.name replaceOccurrencesOfString:@"\\n" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [view.name length])];
            view.enabled = [[viewInfo objectForKey:@"Enabled"] boolValue];
            
            [meas.views addObject:view];
        }
        
        [self.measureView addObject:meas];
    }
}

- (void) initMeasureBar
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Mode" ofType:@"plist"];
    
    NSDictionary *modeInfo = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *settingsInfo = [modeInfo objectForKey:@"settings"];
    
    NSDictionary *settingsMeasureBar = (NSDictionary *)[settingsInfo objectForKey:@"measureBar"];
    
    self.measureBarCount = [[settingsMeasureBar objectForKey:@"count"] intValue];
    NSAssert(self.measureBarCount > 0 && self.measureBarCount <= 6, @"Bar Count is %d.", self.measureBarCount);
    
    self.showTrace = [[settingsMeasureBar objectForKey:@"showTrace"] boolValue];
    self.useBarRatio = [[settingsMeasureBar objectForKey:@"useRatio"] boolValue];
    if(self.useBarRatio == YES)
    {
        self.barRatios = [settingsMeasureBar objectForKey:@"widthRatio"];
        NSAssert(self.barRatios != nil, @"Bar Ratios is nil.");
        NSAssert(self.barRatios.count == 6, @"The count of the Bar Ratios is %d, not 6.", self.barRatios.count);
        NSLog(@"Bar Ratios : %f, %f, %f, %f, %f, %f", [[self.barRatios objectAtIndex:0] floatValue], [[self.barRatios objectAtIndex:1] floatValue], [[self.barRatios objectAtIndex:2] floatValue], [[self.barRatios objectAtIndex:3] floatValue], [[self.barRatios objectAtIndex:4] floatValue], [[self.barRatios objectAtIndex:5] floatValue]);
        if(self.measureBarCount > 0)
            NSAssert([[self.barRatios objectAtIndex:0] floatValue] > 0.0f, @"The 1st Bar Ratios is %f.", [[self.barRatios objectAtIndex:0] floatValue]);
        if(self.measureBarCount > 1)
            NSAssert([[self.barRatios objectAtIndex:1] floatValue] > 0.0f, @"The 2nd Bar Ratios is %f.", [[self.barRatios objectAtIndex:1] floatValue]);
        if(self.measureBarCount > 2)
            NSAssert([[self.barRatios objectAtIndex:2] floatValue] > 0.0f, @"The 3rd Bar Ratios is %f.", [[self.barRatios objectAtIndex:2] floatValue]);
        if(self.measureBarCount > 3)
            NSAssert([[self.barRatios objectAtIndex:3] floatValue] > 0.0f, @"The 4th Bar Ratios is %f.", [[self.barRatios objectAtIndex:3] floatValue]);
        if(self.measureBarCount > 4)
            NSAssert([[self.barRatios objectAtIndex:4] floatValue] > 0.0f, @"The 5th Bar Ratios is %f.", [[self.barRatios objectAtIndex:4] floatValue]);
        if(self.measureBarCount > 5)
            NSAssert([[self.barRatios objectAtIndex:5] floatValue] > 0.0f, @"The 6th Bar Ratios is %f.", [[self.barRatios objectAtIndex:5] floatValue]);
    }
    else
    {
        NSDictionary *widths = [settingsMeasureBar objectForKey:@"width"];
        self.barWidths = [widths objectForKey:@"trace"];
        NSAssert(self.barWidths != nil, @"Bar Widths is nil.");
        NSAssert(self.barWidths.count == 6, @"The count of the Bar Widths is %d, not 6.", self.barWidths.count);
        NSLog(@"Bar Widths : %f, %f, %f, %f, %f, %f", [[self.barWidths objectAtIndex:0] floatValue], [[self.barWidths objectAtIndex:1] floatValue], [[self.barWidths objectAtIndex:2] floatValue], [[self.barWidths objectAtIndex:3] floatValue], [[self.barWidths objectAtIndex:4] floatValue], [[self.barWidths objectAtIndex:5] floatValue]);
        if(self.measureBarCount > 0)
            NSAssert([[self.barWidths objectAtIndex:0] floatValue] > 0.0f, @"The 1st Bar Width is %f.", [[self.barWidths objectAtIndex:0] floatValue]);
        if(self.measureBarCount > 1)
            NSAssert([[self.barWidths objectAtIndex:1] floatValue] > 0.0f, @"The 2nd Bar Width is %f.", [[self.barWidths objectAtIndex:1] floatValue]);
        if(self.measureBarCount > 2)
            NSAssert([[self.barWidths objectAtIndex:2] floatValue] > 0.0f, @"The 3rd Bar Width is %f.", [[self.barWidths objectAtIndex:2] floatValue]);
        if(self.measureBarCount > 3)
            NSAssert([[self.barWidths objectAtIndex:3] floatValue] > 0.0f, @"The 4th Bar Width is %f.", [[self.barWidths objectAtIndex:3] floatValue]);
        if(self.measureBarCount > 4)
            NSAssert([[self.barWidths objectAtIndex:4] floatValue] > 0.0f, @"The 5th Bar Width is %f.", [[self.barWidths objectAtIndex:4] floatValue]);
        if(self.measureBarCount > 5)
            NSAssert([[self.barWidths objectAtIndex:5] floatValue] > 0.0f, @"The 6th Bar Width is %f.", [[self.barWidths objectAtIndex:5] floatValue]);
        
        self.barWidthsWithMenu = [widths objectForKey:@"traceMenu"];
        NSAssert(self.barWidthsWithMenu != nil, @"Bar Widths w/ Menu is nil.");
        NSAssert(self.barWidthsWithMenu.count == 6, @"The count of the Bar Widths w/Menu is %d, not 6.", self.barWidthsWithMenu.count);
        NSLog(@"Bar Widths w/ Menu : %f, %f, %f, %f, %f, %f", [[self.barWidthsWithMenu objectAtIndex:0] floatValue], [[self.barWidthsWithMenu objectAtIndex:1] floatValue], [[self.barWidthsWithMenu objectAtIndex:2] floatValue], [[self.barWidthsWithMenu objectAtIndex:3] floatValue], [[self.barWidthsWithMenu objectAtIndex:4] floatValue], [[self.barWidthsWithMenu objectAtIndex:5] floatValue]);
        if(self.measureBarCount > 0)
            NSAssert([[self.barWidthsWithMenu objectAtIndex:0] floatValue] > 0.0f, @"The 1st Bar Width w/ Menu is %f.", [[self.barWidthsWithMenu objectAtIndex:0] floatValue]);
        if(self.measureBarCount > 1)
            NSAssert([[self.barWidthsWithMenu objectAtIndex:1] floatValue] > 0.0f, @"The 2nd Bar Width w/ Menu is %f.", [[self.barWidthsWithMenu objectAtIndex:1] floatValue]);
        if(self.measureBarCount > 2)
            NSAssert([[self.barWidthsWithMenu objectAtIndex:2] floatValue] > 0.0f, @"The 3rd Bar Width w/ Menu is %f.", [[self.barWidthsWithMenu objectAtIndex:2] floatValue]);
        if(self.measureBarCount > 3)
            NSAssert([[self.barWidthsWithMenu objectAtIndex:3] floatValue] > 0.0f, @"The 4th Bar Width w/ Menu is %f.", [[self.barWidthsWithMenu objectAtIndex:3] floatValue]);
        if(self.measureBarCount > 4)
            NSAssert([[self.barWidthsWithMenu objectAtIndex:4] floatValue] > 0.0f, @"The 5th Bar Width w/ Menu is %f.", [[self.barWidthsWithMenu objectAtIndex:4] floatValue]);
        if(self.measureBarCount > 5)
            NSAssert([[self.barWidthsWithMenu objectAtIndex:5] floatValue] > 0.0f, @"The 6th Bar Width w/ Menu is %f.", [[self.barWidthsWithMenu objectAtIndex:5] floatValue]);
    }
}

@end

