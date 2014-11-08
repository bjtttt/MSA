//
//  UISoftKeyEnum.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftKeyEnum.h"
#import "UISoftKeyEnumItem.h"

@interface UISoftKeyEnum()

@end

@implementation UISoftKeyEnum

- (id) init
{
    if(self = [super init])
    {
        //self.name = [[NSMutableString alloc] initWithString:@""];
        self.itemArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(UISoftKeyEnumItem *)addEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort
{
    NSAssert(self.itemArray != nil, @"UISoftKeyEnum Enum Item Array is nil");
    NSAssert([self findEnumItemByValue:value] == nil, @"UISoftKeyEnum Enum Item Array already has %d", value);

    UISoftKeyEnumItem *item = [[UISoftKeyEnumItem alloc] init];
    item.value = value;
    if(label == nil)
        item.label = [[NSMutableString alloc] initWithString:@""];
    else
        item.label = [[NSMutableString alloc] initWithString:label];
    if(labelShort == nil)
        item.labelShort = [[NSMutableString alloc] initWithString:@""];
    else
        item.labelShort = [[NSMutableString alloc] initWithString:labelShort];
    item.softkeyEnum = self;
    
    if(self.itemArray.count > 0)
    {
        int index=(int)self.itemArray.count-1;
        UISoftKeyEnumItem *previousItem=(UISoftKeyEnumItem *)[self.itemArray objectAtIndex:index];
        previousItem.next=item;
        item.previous=previousItem;
    }
    [self.itemArray addObject:item];
    
    return item;
}

-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value
{
    NSAssert(self.itemArray != nil, @"UISoftKeyEnum Enum Item Array is nil");
    
    int count=(int)self.itemArray.count;
    for(int index=0;index<count;index++)
    {
        UISoftKeyEnumItem *item=(UISoftKeyEnumItem *)[self.itemArray objectAtIndex:index];
        if(item.value==value)
            return item;
    }
    
    //NSAssert(YES==NO, @"UISoftKeyEnum Enum Item Array doesn't contain %d", value);
    
    return nil;
}

@end