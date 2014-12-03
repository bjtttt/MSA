//
//  MenuContainerView.m
//  MSA
//
//  Created by GUO Zhitao on 29/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "MenuContainerView.h"

@interface MenuContainerView ()

@end

@implementation MenuContainerView

/*
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    self.sendNotification = !self.sendNotification;
    if(self.sendNotification == NO)
        return [super hitTest:point withEvent:event];
    
    NSLog(@"MainContainerView : hitTest");
    
    NSLog(@"Touch Position : x = %f, y = %f", point.x, point.y);

    //CGPoint pointForTargetView = [self.barPopupMenuV convertPoint:point fromView:self];
    
    self.shareSettings.barPopupMenuAreaTapped = NO;
    self.shareSettings.navPresetMenuButtonAreaTapped = NO;
    self.shareSettings.presetMenuAreaTapped = NO;
    self.shareSettings.barTappedIndex = -1;

    if(CGRectContainsPoint(self.shareSettings.barPopupMenuCGRect, point))
    {
        self.shareSettings.barPopupMenuAreaTapped = YES;
        return [self.barPopupMenuV hitTest:point withEvent:event];
    }
    
    //CGPoint pointForTargetView1 = [self.barCV convertPoint:point fromView:self];

    if(CGRectContainsPoint(self.shareSettings.barCGRect, point))
    {
        return [self.barCV hitTest:point withEvent:event];
    }
    
    if(CGRectContainsPoint(self.shareSettings.navBarPresetMenuButtonCGRect, point))
    {
        self.shareSettings.navPresetMenuButtonAreaTapped = YES;
    }
    
    if(CGRectContainsPoint(self.shareSettings.presetMenuCGRect, point))
    {
        self.shareSettings.presetMenuAreaTapped = YES;
    }

    [[NSNotificationCenter defaultCenter] postNotificationName:@"barPopupMenuAreaTapped" object:nil];

    return [super hitTest:point withEvent:event];
}
*/

@end
