//
//  UISoftMenu.m
//  MSA
//
//  Created by 智滔郭 on 11/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftMenu.h"
#import "ShareSettings.h"

@interface UISoftMenu()

@end

@implementation UISoftMenu

-(id)init
{
    [NSException raise:@"UISoftMenu::init" format:@"Call UISoftMenu::initWithConfig: instead"];
    
    return nil;
}

-(id)initWithConfig:(ShareSettings *)ss
{
    if(self = [super init])
    {
        _shareSettings = ss;
        _measBarPanels = [[NSMutableArray alloc] init];
        _softMenuPanels = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
