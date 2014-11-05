//
//  UISoftKeyEnum.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftKeyEnum.h"

@interface UISoftKeyEnum()

@end

@implementation UISoftKeyEnum

- (id) init
{
    if(self = [super init])
    {
        self.name = [[NSMutableString alloc] initWithString:@""];
        self.itemArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end