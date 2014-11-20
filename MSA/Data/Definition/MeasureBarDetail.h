//
//  MeasureBarDetail.h
//  MSA
//
//  Created by 智滔郭 on 11/15/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_MeasureBarDetail_h
#define MSA_MeasureBarDetail_h

@interface MeasureBarDetail : NSObject

@property (nonatomic) NSMutableString *measure;
@property (nonatomic) bool useRatio;
@property (nonatomic) int mbarCount;
//@property (nonatomic) int mbarSmallCount;
@property (nonatomic) NSMutableArray *mbarWidths;
@property (nonatomic) NSMutableArray *mbarSmallWidths;
@property (nonatomic) float totalWidth;
@property (nonatomic) float totalSmallWidth;

@end

#endif
