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

-(id)init
{
    [NSException raise:@"EnumParameter::init:" format:@"EnumParameter can only use initWithEnumMemberInfo:display:displayShort:"];
    
    if(self = [super init])
    {
    }
    
    return self;
}

- (id) initWithEnumMemberInfo:(int)value withLabel:(NSString *)label withLabelShort:(NSString *)labelShort
{
    if(self = [super init])
    {
        _value = value;
        _label = label;
        _labelShort = labelShort;
    }
    
    return self;
}

@end
