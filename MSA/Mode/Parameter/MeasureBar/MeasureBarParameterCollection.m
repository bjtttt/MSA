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
        self.parDict=[[NSDictionary alloc] init];
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
    int count = mbarSystem.count;
    for(int i=0;i<count;i++)
    {
        UISoftPanel *sPanel=[mbarSystem objectAtIndex:i];
        NSMutableArray *sKeyArray=sPanel.keyArray;
        int countKeys=sKeyArray.count;
        for(int j=0;j<countKeys;j++)
        {
            UISoftKey *sKey=[sKeyArray objectAtIndex:j];
            NSMutableString *nameString=sKey.nameString;
            ValueType vType=sKey.valueType;
            switch(sKey.valueType)
            {
                case VAL_IMM:
                    break;
                case VAL_STRING:
                    break;
                case VAL_INT:
                case VAL_DOUBLE:
                case VAL_BOOL_AUTOMAN:
                case VAL_BOOL_ONOFF:
                case VAL_ENUM:
                    break;
                default:
                case VAL_NONE:
                    break;
            }
        }
    }
}

@end
