//
//  UISoftPanel.h
//  MSA
//
//  Created by GUO Zhitao on 04/11/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_UISoftPanel_h
#define MSA_UISoftPanel_h

@class UISoftKey;
@class ShareSettings;

@interface UISoftPanel : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) NSMutableString *title;
@property (nonatomic) NSMutableArray *keyArray;

-(void)addSoftKey:(UISoftKey *)uiSK;

@end

#endif
