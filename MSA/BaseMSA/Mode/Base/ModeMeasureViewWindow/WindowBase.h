//
//  WindowBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModeParams;
@class ShareSettings;

@interface WindowBase : NSObject

@property (nonatomic) NSString *windowName;
@property (nonatomic) ShareSettings *shareSettings;

-(instancetype)initWithConfig:(ShareSettings *)ss NS_DESIGNATED_INITIALIZER;

@end