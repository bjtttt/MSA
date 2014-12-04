//
//  MeasureBarContainerView.m
//  MSA
//
//  Created by GUO Zhitao on 29/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "MeasureBarContainerView.h"

@interface MeasureBarContainerView ()

@end

@implementation MeasureBarContainerView

/*
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    self.sendNotification = !self.sendNotification;
    if(self.sendNotification == NO)
        return [super hitTest:point withEvent:event];

    NSLog(@"MeasureBarContainerView : hitTest");

    //NSLog(@"Touch Position : x = %f, y = %f", point.x, point.y);

    NSUInteger count = self.barVs.count;
    for(int i=0;i<count;i++)
    {
        UIView * v = (UIView *)[self.barVs objectAtIndex:i];
        CGPoint pointForTargetView = [v convertPoint:point fromView:self];
        
        //NSLog(@"Convert Touch Position : x = %f, y = %f", pointForTargetView.x, pointForTargetView.y);
        //NSLog(@"Measure Bar %d (0 based) Bounds : x = %f, y = %f, width = %f, height = %f", i, v.bounds.origin.x, v.bounds.origin.y, v.bounds.size.width, v.bounds.size.height);
        //NSLog(@"Measure Bar %d (0 based) Frame : x = %f, y = %f, width = %f, height = %f", i, v.frame.origin.x, v.frame.origin.y, v.frame.size.width, v.frame.size.height);

        if(CGRectContainsPoint(v.bounds, pointForTargetView))
        {
            self.shareSettings.barTappedIndex = i;
            
            //self.sendNotification = !self.sendNotification;
            //if(self.sendNotification == NO)
            [[NSNotificationCenter defaultCenter] postNotificationName:@"barTappedIndex" object:nil];
            
            return [v hitTest:point withEvent:event];
        }
    }

    return [super hitTest:point withEvent:event];
}
*/

@end
