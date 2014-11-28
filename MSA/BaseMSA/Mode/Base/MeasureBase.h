//
//  MeasureBase.h
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewBase;

@interface MeasureBase : NSObject

@property (nonatomic) NSMutableString *measureName;
@property (nonatomic) NSMutableDictionary *viewDict;

@property (nonatomic) ViewBase *curView;

@end