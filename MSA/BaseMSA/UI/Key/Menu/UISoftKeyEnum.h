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
@class ShareSettings;

@interface UISoftKeyEnum : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) UISoftKey *softkey;

@property (nonatomic) Parameter *connectParam;
@property (nonatomic) NSMutableArray *itemArray;

-(UISoftKeyEnumItem *)addEnumItem:(int)value label:(NSString *)label labelShort:(NSString *)labelShort;
-(UISoftKeyEnumItem *)findEnumItemByValue:(int)value;

@end

#endif
