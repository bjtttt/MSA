//
//  ContainerViewController.h
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum vcLayoutType {
    VC_DISPLAY,
    VC_MENU,
    VC_CONNECT
} VCLayoutType;

@interface ContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *displayVC;
@property (strong, nonatomic) ShareSettings * shareSettings;

//- (void)layoutVC:(VCLayoutType)layoutType animated:(BOOL)animated;

@end

