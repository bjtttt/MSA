//
//  MsgSplitViewController.m
//  MSA
//
//  Created by guozhitao on 9/10/14.
//  Copyright (c) 2014 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "MsgSplitViewController.h"

//@interface MsgSplitViewController ()
//
//@end

@implementation MsgSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.msgMasterNVC=[self.viewControllers lastObject];
    self.msgDetailCVC=[self.viewControllers firstObject];
}

@end
