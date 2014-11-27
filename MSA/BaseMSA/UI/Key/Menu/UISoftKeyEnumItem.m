//
//  UISoftKeyEnumItem.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftKeyEnumItem.h"

@interface UISoftKeyEnumItem()

@end

@implementation UISoftKeyEnumItem

- (id) init
{
    if(self = [super init])
    {
        self.value = 0;
        self.label = [[NSMutableString alloc] initWithString:@""];
        self.labelShort = [[NSMutableString alloc] initWithString:@""];

        self.next = nil;
        self.previous = nil;
        self.softkeyEnum = nil;
    }
    
    return self;
}

@end