//
//  MeasureBarDetail.m
//  MSA
//
//  Created by 智滔郭 on 11/15/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureBarDetail.h"

@interface MeasureBarDetail()

@end

@implementation MeasureBarDetail

- (id) init
{
    if(self = [super init])
    {
        self.useRatio = true;
        self.mbarCount = 0;
        self.totalWidth = 0.0f;
        self.totalSmallWidth = 0.0f;
        self.mbarWidths = [[NSMutableArray alloc] init];
        self.mbarSmallWidths = [[NSMutableArray alloc] init];
        self.popupMenuHeights = [[NSMutableArray alloc] init];
        self.popupMenuWidths = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
