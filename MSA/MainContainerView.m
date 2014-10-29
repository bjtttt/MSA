//
//  MainContainerView.m
//  MSA
//
//  Created by GUO Zhitao on 29/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "MainContainerView.h"

@interface MainContainerView ()

@end

@implementation MainContainerView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"Touch Position : x = %f, y = %f", point.x, point.y);

    CGPoint pointForTargetView = [self.barPopupMenuV convertPoint:point fromView:self];
    
    NSLog(@"Convert Touch Position : x = %f, y = %f", pointForTargetView.x, pointForTargetView.y);
    NSLog(@"Measure Bar Popup Menu Bounds : x = %f, y = %f, width = %f, height = %f", self.barPopupMenuV.bounds.origin.x, self.barPopupMenuV.bounds.origin.y, self.barPopupMenuV.bounds.size.width, self.barPopupMenuV.bounds.size.height);
    
    self.shareSettings.notBarPopupMenuTapped = YES;
    self.shareSettings.notBarTapped = YES;

    if(CGRectContainsPoint(self.barPopupMenuV.bounds, pointForTargetView))
    {
        self.shareSettings.notBarPopupMenuTapped = NO;

        NSLog(@"Measure Bar Popup Menu : x = %f, y = %f, width = %f, height = %f", self.barPopupMenuV.frame.origin.x, self.barPopupMenuV.frame.origin.y, self.barPopupMenuV.frame.size.width, self.barPopupMenuV.frame.size.height);
        return [self.barPopupMenuV hitTest:point withEvent:event];
    }
    
    CGPoint pointForTargetView1 = [self.barV convertPoint:point fromView:self];

    NSLog(@"Convert Touch Position 1 : x = %f, y = %f", pointForTargetView1.x, pointForTargetView1.y);
    NSLog(@"Measure Bar Bounds : x = %f, y = %f, width = %f, height = %f", self.barV.bounds.origin.x, self.barV.bounds.origin.y, self.barV.bounds.size.width, self.barV.bounds.size.height);

    if(CGRectContainsPoint(self.barV.bounds, pointForTargetView1))
    {
        self.shareSettings.notBarTapped = NO;

        NSLog(@"Measure Bar : x = %f, y = %f, width = %f, height = %f", self.barV.frame.origin.x, self.barV.frame.origin.y, self.barV.frame.size.width, self.barPopupMenuV.frame.size.height);
        return [self.barV hitTest:point withEvent:event];
    }


    return [super hitTest:point withEvent:event];
}

@end
