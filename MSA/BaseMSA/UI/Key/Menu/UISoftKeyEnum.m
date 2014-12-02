//
//  UISoftKeyEnum.m
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UISoftPanel.h"
#import "UISoftKey.h"
#import "UISoftKeyEnum.h"
#import "UISoftKeyEnumItem.h"

@interface UISoftKeyEnum()

@end

@implementation UISoftKeyEnum

- (id) init
{
    if(self = [super init])
    {
        _itemArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(UISoftKeyEnumItem *)addEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort
{
    if(_itemArray == nil)
        [NSException raise:@"UISoftKeyEnum::addEnumItem:label:labelShort" format:@"UISoftPanel(\"%@\")-UISoftKey(\"%@\") : Enum item array is nil", self.softkey.softPanel.title, self.softkey.label];
    if([self findEnumItemByValue:value] != nil)
        [NSException raise:@"UISoftKeyEnum::addEnumItem:label:labelShort" format:@"UISoftPanel(\"%@\")-UISoftKey(\"%@\") : Enum item array already contains %d", _softkey.softPanel.title, _softkey.label, value];

    UISoftKeyEnumItem *item = [[UISoftKeyEnumItem alloc] init];
    item.value = value;
    item.label = label;             // Maybe it is nil
    item.labelShort = labelShort;   // Maybe it is nil
    item.softkeyEnum = self;
    
    [_itemArray addObject:item];
    
    return item;
}

-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value
{
    if(_itemArray == nil)
        [NSException raise:@"UISoftKeyEnum::findEnumItemByValue:" format:@"UISoftPanel(\"%@\")-UISoftKey(\"%@\") : Enum item array is nil", _softkey.softPanel.title, _softkey.label];
    
    int count=(int)_itemArray.count;
    for(int index=0;index<count;index++)
    {
        UISoftKeyEnumItem *item=(UISoftKeyEnumItem *)[self.itemArray objectAtIndex:index];
        if(item.value==value)
            return item;
    }
    
    return nil;
}

@end