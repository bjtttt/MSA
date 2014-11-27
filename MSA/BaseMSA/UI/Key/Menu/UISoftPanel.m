//
//  UISoftPanel.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftPanel.h"

@interface UISoftPanel()

@end

@implementation UISoftPanel

- (id) init
{
    if(self = [super init])
    {
        self.title = [[NSMutableString alloc] initWithString:@""];
        self.keyArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
