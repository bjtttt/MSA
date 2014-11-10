//
//  MeasureBarParameterCollection.m
//  MSA
//
//  Created by guozhitao on 10/4/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasureBarParameterCollection.h"
#import "UISoftMenu.h"
#import "UISoftPanel.h"
#import "UISoftKey.h"
#import "ShareSettings.h"
#import "ImmediateParameter.h"

@interface MeasureBarParameterCollection()

@end

@implementation MeasureBarParameterCollection

+ (id)parameterCollection
{
    static id parCollection = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        parCollection = [[self alloc] init];
    });
    
    return parCollection;
}

-(id) init {
    if ((self = [super init]))
    {
        self.parDict=[[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void)registerParameterEvent
{
    
}

-(void)unregisterParameterEvent
{
    
}

-(void)parseParameter
{
    UISoftMenu *sMenu = self.shareSettings.softMenuSystem;
    NSMutableArray *mbarSystem = sMenu.measBarPanels;
    int count = (int)mbarSystem.count;
    for(int i=0;i<count;i++)
    {
        UISoftPanel *sPanel=[mbarSystem objectAtIndex:i];
        NSMutableArray *sKeyArray=sPanel.keyArray;
        int countKeys=(int)sKeyArray.count;
        for(int j=0;j<countKeys;j++)
        {
            UISoftKey *sKey=[sKeyArray objectAtIndex:j];
            NSMutableString *nameString=sKey.nameString;
            NSAssert(nameString != nil, @"UISoftKey %@ has nil Name String.", sKey.label);
            NSAssert(nameString.length > 0, @"UISoftKey %@ has empty Name String.", sKey.label);
            switch(sKey.valueType)
            {
                case VAL_IMM:
                    [self.parDict setObject:[[ImmediateParameter alloc] init] forKey:nameString];
                    break;
                case VAL_STRING:
                    [self.parDict setObject:sKey.valueString forKey:nameString];
                    break;
                case VAL_INT:
                case VAL_DOUBLE:
                case VAL_BOOL_AUTOMAN:
                case VAL_BOOL_ONOFF:
                case VAL_ENUM:
                    [self.parDict setObject:sKey.value forKey:nameString];
                    break;
                default:
                //case VAL_NONE:
                    NSAssert(false, @"UISoftKey %@ has a value type of %d", sKey.label, sKey.valueType);
                    break;
            }
            if(sKey.subSoftkey != nil)
            {
                nameString=sKey.subSoftkey.nameString;
                switch(sKey.subSoftkey.valueType)
                {
                    case VAL_BOOL_AUTOMAN:
                    case VAL_BOOL_ONOFF:
                    case VAL_ENUM:
                        [self.parDict setObject:sKey.value forKey:nameString];
                        break;
                    default:
                    //case VAL_STRING:
                    //case VAL_IMM:
                    //case VAL_INT:
                    //case VAL_DOUBLE:
                    //case VAL_NONE:
                        NSAssert(false, @"UISoftKey %@ has a sub value type of %d", sKey.label, sKey.subSoftkey.valueType);
                        break;
                }
            }
        }
    }
}

@end
