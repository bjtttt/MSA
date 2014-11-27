//
//  EnumMemberInfo.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumMemberInfo.h"
#import "ShareSettings.h"

@interface EnumMemberInfo()

@end

@implementation EnumMemberInfo

- (id) init
{
    NSAssert(YES == NO, @"EnumParameter can only use initWithEnumMemberInfo");
    
    if(self = [super init])
    {
    }
    
    return self;
}

- (id) initWithEnumMemberInfo:(int)value display:(NSString *)display displayShort:(NSString *)displayShort
{
    if(self = [super init])
    {
        self.value = value;
        self.display = display;
        self.displayShort = displayShort;
    }
    
    return self;
}

@end
