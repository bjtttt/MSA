//
//  ShareSettings.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-27.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareSettings : NSObject

@property (nonatomic) BOOL connectTapped;
@property (nonatomic) BOOL menuTapped;

+ (id)sharedSettings;

@end