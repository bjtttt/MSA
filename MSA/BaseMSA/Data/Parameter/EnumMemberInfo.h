//
//  EnumMemberInfo.h
//  MSA
//
//  Created by 智滔郭 on 11/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#ifndef MSA_EnumMemberInfo_h
#define MSA_EnumMemberInfo_h

@interface EnumMemberInfo : NSObject

@property (nonatomic) int value;
@property (nonatomic) NSString *label;
@property (nonatomic) NSString *labelShort;

-(id)initWithEnumMemberInfo:(int)value withLabel:(NSString *)label withLabelShort:(NSString *)labelShort;

@end

#endif
