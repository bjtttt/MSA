//
//  BarViewControllerViewBase.m
//  MSA
//
//  Created by GUO Zhitao on 29/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareSettings.h"
#import "BarViewControllerViewBase.h"

@interface BarViewControllerViewBase ()

@end

@implementation BarViewControllerViewBase

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    self.sendNotification = !self.sendNotification;
    if(self.sendNotification == NO)
        return [super hitTest:point withEvent:event];
    
    NSLog(@"MeasureBarContainerView : hitTest");
    
    NSLog(@"Touch Position : x = %f, y = %f", point.x, point.y);
    
    CGPoint pointForTargetView = [self convertPoint:point fromView:self];
        
    NSLog(@"Convert Touch Position : x = %f, y = %f", pointForTargetView.x, pointForTargetView.y);
    NSLog(@"Measure Bar %d (0 based) Bounds : x = %f, y = %f, width = %f, height = %f", self.curMeasBarIndex, self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
    NSLog(@"Measure Bar %d (0 based) Frame : x = %f, y = %f, width = %f, height = %f", self.curMeasBarIndex, self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        
    if(CGRectContainsPoint(self.bounds, pointForTargetView))
    {
        self.shareSettings.barTappedIndex = self.curMeasBarIndex;
            
        //self.sendNotification = !self.sendNotification;
        //if(self.sendNotification == NO)
        [[NSNotificationCenter defaultCenter] postNotificationName:@"barTappedIndex" object:nil];
            
        return [super hitTest:point withEvent:event];
    }
    
    return [super hitTest:point withEvent:event];
}

@end
