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
    self.sendNotification = !self.sendNotification;
    if(self.sendNotification == NO)
        return [super hitTest:point withEvent:event];
    
    NSLog(@"MainContainerView : hitTest");
    
    //NSLog(@"Touch Position : x = %f, y = %f", point.x, point.y);

    CGPoint pointForTargetView = [self.barPopupMenuV convertPoint:point fromView:self];
    
    //NSLog(@"Convert Touch Position : x = %f, y = %f", pointForTargetView.x, pointForTargetView.y);
    //NSLog(@"Measure Bar Popup Menu Bounds : x = %f, y = %f, width = %f, height = %f", self.barPopupMenuV.bounds.origin.x, self.barPopupMenuV.bounds.origin.y, self.barPopupMenuV.bounds.size.width, self.barPopupMenuV.bounds.size.height);
    
    self.shareSettings.barPopupMenuAreaTapped = NO;
    self.shareSettings.barTappedIndex = -1;

    if(CGRectContainsPoint(self.shareSettings.barPopupMenuCGRect, pointForTargetView))//self.barPopupMenuV.bounds, pointForTargetView))
    //if(CGRectContainsPoint(self.barPopupMenuV.bounds, pointForTargetView))
    {
        self.shareSettings.barPopupMenuAreaTapped = YES;
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"barPopupMenuAreaTapped" object:nil];
        
        //NSLog(@"Measure Bar Popup Menu : x = %f, y = %f, width = %f, height = %f", self.barPopupMenuV.frame.origin.x, self.barPopupMenuV.frame.origin.y, self.barPopupMenuV.frame.size.width, self.barPopupMenuV.frame.size.height);
        return [self.barPopupMenuV hitTest:point withEvent:event];
    }
    
    CGPoint pointForTargetView1 = [self.barCV convertPoint:point fromView:self];

    //NSLog(@"Convert Touch Position 1 : x = %f, y = %f", pointForTargetView1.x, pointForTargetView1.y);
    //NSLog(@"Measure Bar Bounds : x = %f, y = %f, width = %f, height = %f", self.barCV.bounds.origin.x, self.barCV.bounds.origin.y, self.barCV.bounds.size.width, self.barCV.bounds.size.height);

    if(CGRectContainsPoint(self.shareSettings.barCGRect, pointForTargetView1))// self.barCV.bounds, pointForTargetView1))
    //if(CGRectContainsPoint(self.barCV.bounds, pointForTargetView1))
    {
        //NSLog(@"Measure Bar : x = %f, y = %f, width = %f, height = %f", self.barCV.frame.origin.x, self.barCV.frame.origin.y, self.barCV.frame.size.width, self.barCV.frame.size.height);
        return [self.barCV hitTest:point withEvent:event];
    }

    //self.sendNotification = !self.sendNotification;
    //if(self.sendNotification == NO)
    [[NSNotificationCenter defaultCenter] postNotificationName:@"barPopupMenuAreaTapped" object:nil];

    return [super hitTest:point withEvent:event];
}

@end
