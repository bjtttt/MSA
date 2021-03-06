//
//  UIKeyMeasure.m
//  MSA
//
//  Created by GUO Zhitao on 25/09/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKeyMeasure.h"

@interface UIKeyMeasure()

@end

@implementation UIKeyMeasure

- (instancetype) init
{
    if(self = [super init])
    {
        self.name = [[NSMutableString alloc] initWithString:@""];
        self.nameDisplay = [[NSMutableString alloc] initWithString:@""];
        self.isDefault = NO;
        self.enabled = NO;
        self.views = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
