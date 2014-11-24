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
@property (nonatomic) NSMutableString *key;

@end

#endif
