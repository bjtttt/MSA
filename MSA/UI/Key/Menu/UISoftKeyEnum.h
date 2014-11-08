//
//  UISoftKeyEnum.h
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_UISoftKeyEnum_h
#define MSA_UISoftKeyEnum_h

#import "ShareSettings.h"

@class UISoftKey;
@class UISoftKeyEnumItem;

@interface UISoftKeyEnum : NSObject

//@property (nonatomic) NSMutableString *name;
@property (nonatomic) NSMutableArray *itemArray;

@property (nonatomic) UISoftKey *softkey;

-(UISoftKeyEnumItem *)addEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort;
-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value;

@end

#endif
