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

-(instancetype)init
{
    [NSException raise:@"UISoftKeyEnumItem::init" format:@"Call UISoftKeyEnumItem::initWithConfig: instead"];
    
    return nil;
}

-(instancetype)initWithConfig:(ShareSettings *)ss
{
    if(self = [super init])
    {
        _shareSettings = ss;
    }
    
    return self;
}

@end