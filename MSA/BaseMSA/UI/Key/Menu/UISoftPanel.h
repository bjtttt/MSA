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

@property (nonatomic) NSString *title;
@property (nonatomic) NSMutableArray *keyArray;

@property (nonatomic) UISoftKey *parentSoftKey;

-(void)addSoftKey:(UISoftKey *)uiSK;
-(id)initWithConfig:(ShareSettings *)ss;

@end

#endif
