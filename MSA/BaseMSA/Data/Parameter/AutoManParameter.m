//
//  AutoManParameter.m
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoManParameter.h"
//#import "ShareSettings.h"
//#import "Parameter.h"

@interface AutoManParameter()

@end

@implementation AutoManParameter

- (id) init
{
    if(self = [super init])
    {
        self.valueType = VAL_BOOL_AUTOMAN;
        self.yesLabel = [[NSMutableString alloc] initWithString:@"Auto"];
        self.yesLabelShort = [[NSMutableString alloc] initWithString:@"Auto"];
        self.noLabel = [[NSMutableString alloc] initWithString:@"Man"];
        self.noLabelShort = [[NSMutableString alloc] initWithString:@"Man"];
    }
    
    return self;
}

@end
