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
    CGPoint pointForTargetView = [self.barPopupMenuV convertPoint:point fromView:self];
    
    if(CGRectContainsPoint(self.barPopupMenuV.bounds, pointForTargetView))
    {
        NSLog(@"Measure Bar Popup Menu : x = %f, y = %f)
        return [self.barPopupMenuV hitTest:point withEvent:event];
    }

    CGPoint pointForTargetView1 = [self.barV convertPoint:point fromView:self];
    
    if(CGRectContainsPoint(self.barV.bounds, pointForTargetView1))
    {
        return [self.barV hitTest:point withEvent:event];
    }

    return [super hitTest:point withEvent:event];
}

@end
