//
//  DisplayViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DisplayViewController.h"
#import "DisplayViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    [super prepareForSegue:segue sender:sender];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.msgCVC.shareSettings = self.shareSettings;
    
    //self.settingsV.layer.borderWidth = BORDER_WIDTH;
    //self.settingsV.layer.borderColor = [[UIColor blackColor] CGColor];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"presentSegueToMsgCVC"])
    {
        self.msgCVC = (MsgContainerViewController *)segue.destinationViewController;
        self.msgCVC.shareSettings = self.shareSettings;
    }
    if([segue.identifier isEqualToString:@"presentSegueToSystemCVC"])
    {
        self.systCVC = (SystemContainerViewController *)segue.destinationViewController;
        self.systCVC.shareSettings = self.shareSettings;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.navBarHeight=self.displayNavBar.frame.size.height;
    self.toolBarHeight=self.displayToolBar.frame.size.height;
    self.settingsHeight=self.settingsV.frame.size.height;
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.displayNavBar.frame = CGRectMake(0, 0, self.frameWidth, self.navBarHeight);
    self.displayToolBar.frame = CGRectMake(0, self.frameHeight-self.toolBarHeight, self.frameWidth, self.toolBarHeight);

    self.settingsV.frame = CGRectMake(0, self.navBarHeight, self.frameWidth, self.settingsHeight);
    self.tracesV.frame = CGRectMake(0, self.navBarHeight+self.settingsHeight, self.frameWidth, self.frameHeight-self.navBarHeight-self.toolBarHeight-self.settingsHeight);
}

- (IBAction)showHideMenu:(id)sender {
    self.shareSettings.menuTapped=!self.shareSettings.menuTapped;
    if(self.shareSettings.menuTapped)
        [self.showHideMenuButton setImage:[UIImage imageNamed:@"HideMenu.png"] forState:UIControlStateNormal];
    else
        [self.showHideMenuButton setImage:[UIImage imageNamed:@"ShowMenu.png"] forState:UIControlStateNormal];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuTapped" object:nil];
}

- (IBAction)exitToHere:(UIStoryboardSegue *)sender {
    // Nothing to do here
}

@end
