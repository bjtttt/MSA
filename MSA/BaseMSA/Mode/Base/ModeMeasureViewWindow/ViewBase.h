//
//  ViewBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareSettings;

@interface ViewBase : NSObject

@property (nonatomic) NSMutableString *viewName;
@property (nonatomic) NSMutableDictionary *windowDict;

@property (nonatomic) ShareSettings *shareSettings;

@end