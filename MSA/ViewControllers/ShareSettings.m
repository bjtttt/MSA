//
//  ShareSettings.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-27.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "UIKeyMeasure.h"
#import "UIKeyView.h"

@implementation ShareSettings

+ (id)sharedSettings
{
    static id shareSettings = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shareSettings = [[self alloc] init];
    });
    
    return shareSettings;
}

- (void) initMeasureView
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Mode" ofType:@"plist"];
   
    NSDictionary *modeInfo = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *measViewInfos = [modeInfo objectForKey:@"measure"];
    
    self.measureView = [[NSMutableArray alloc] init];
    for(NSString *measKey in measViewInfos)
    {
        NSDictionary *measInfo = [measViewInfos objectForKey:measKey];
        UIKeyMeasure *meas = [[UIKeyMeasure alloc] init];
        meas.name = [[NSMutableString alloc] initWithString:measKey];
        [meas.name replaceOccurrencesOfString:@"\\n" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [meas.name length])];
        meas.enabled = [[measInfo objectForKey:@"Enabled"] boolValue];
        
        NSDictionary *viewInfos = (NSDictionary *)[measInfo objectForKey:@"View"];
        for(NSString *viewKey in viewInfos)
        {
            NSDictionary *viewInfo = [viewInfos objectForKey:viewKey];
            UIKeyView *view = [[UIKeyView alloc] init];
            view.name = [[NSMutableString alloc] initWithString:viewKey];
            [view.name replaceOccurrencesOfString:@"\\n" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [view.name length])];
            view.enabled = [[viewInfo objectForKey:@"Enabled"] boolValue];
            
            [meas.views addObject:view];
        }
        
        [self.measureView addObject:meas];
    }
}

@end

