//
//  UISoftPanel.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftPanel.h"
#import "UISoftKey.h"

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

-(void)addSoftKey:(UISoftKey *)uiSK
{
    if(uiSK == nil)
    {
        NSAssert(YES==NO, @"SoftPanel %@ cannot add nil SoftKey", self.title);
        return;
    }
    
    int count = (int)self.keyArray.count;
    if(count < 1)
        [self.keyArray addObject:uiSK];
    else
    {
        UISoftKey *uiPrevSK = self.keyArray[count-1];
        [self.keyArray addObject:uiSK];
        uiPrevSK.next = uiSK;
        uiSK.previous = uiPrevSK;
    }
}

@end
