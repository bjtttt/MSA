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
@property (nonatomic) NSString *display;
@property (nonatomic) NSString *displayShort;

- (id) initWithEnumMemberInfo:(int)value display:(NSString *)display displayShort:(NSString *)displayShort;

@end

#endif
