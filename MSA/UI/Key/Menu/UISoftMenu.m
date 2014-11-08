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

- (id) init
{
    if(self = [super init])
    {
        self.measBarPanels = [[NSMutableArray alloc] init];
        self.softMenuPanels = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)initMeasureBarPanels
{
    
}

@end
