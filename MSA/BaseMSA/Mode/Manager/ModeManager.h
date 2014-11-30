//
//  ModeManager.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Mode;
@class ShareSettings;

@interface ModeManager : NSObject

@property (nonatomic) Mode *mode;

@property (nonatomic) ShareSettings *shareSettings;

-(void)initMode;

@end