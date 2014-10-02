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
    UIGraphicsBeginImageContext(uiVC.view.bounds.size);
    [uiVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(saveInAlbum == YES)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    return image;
}

-(UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
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

@end

