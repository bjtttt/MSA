//
//  Parameter.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_Parameter_h
#define MSA_Parameter_h

#import "ShareSettings.h"

@interface Parameter : NSObject

@property (nonatomic) ValueType valueType;

@property (nonatomic) NSString *key;

@property (nonatomic) NSString *label;
@property (nonatomic) NSString *labelShort;

@property (nonatomic) ShareSettings *shareSettings;

-(id)initWithConfig:(ShareSettings *)ss;

@end

#endif
