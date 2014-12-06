//
//  BlurViewController.m
//  MSA
//
//  Created by guozhitao on 10/2/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "BlurViewController.h"

@interface BlurViewController ()

@end

@implementation BlurViewController

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    self.blurImage.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
}

@end
