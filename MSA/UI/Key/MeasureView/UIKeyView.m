//
//  UIKeyView.m
//  MSA
//
//  Created by GUO Zhitao on 25/09/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKeyView.h"

@interface UIKeyView()

@end

@implementation UIKeyView

- (id) init
{
    if(self = [super init])
    {
        self.name = [[NSMutableString alloc] initWithString:@""];
        self.enabled = NO;
    }
    
    return self;
}

@end
