//
//  UISoftMenu.h
//  MSA
//
//  Created by 智滔郭 on 11/8/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_UISoftMenu_h
#define MSA_UISoftMenu_h

@class ShareSettings;

@interface UISoftMenu : NSObject

@property (nonatomic) ShareSettings *shareSettings;

@property (nonatomic) NSMutableArray *measBarPanels;
@property (nonatomic) NSMutableArray *softMenuPanels;

-(id)initWithConfig:(ShareSettings *)ss;

@end

#endif
