//
//  ModeManager.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;

@interface ModeManager : NSObject

@property (nonatomic) ShareSettings *shareSettings;

-(void)initMode;
-(void)initMenuSystem;

@end