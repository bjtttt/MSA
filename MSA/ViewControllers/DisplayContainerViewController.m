//
//  DisplayContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DisplayContainerViewController.h"
#import "DisplayTracesContainerViewController.h"
#import "ContainerViewController.h"
#import "MenuContainerViewController.h"
#import "DisplaySettingsContainerViewController.h"
#import "MsgContainerViewController.h"
#import "SystemContainerViewController.h"

@interface DisplayContainerViewController ()

@end

@implementation DisplayContainerViewController

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    [super prepareForSegue:segue sender:sender];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.msgCVC.shareSettings = self.shareSettings;
    
    //self.settingsV.layer.borderWidth = NORMAL_BORDER_WIDTH;
    //self.settingsV.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    //self.tracesV.layer.borderWidth = HEAVY_BORDER_WIDTH;
    //self.tracesV.layer.borderColor = [[UIColor grayColor] CGColor];
    
    self.navBarHeight=NAVBAR_HEIGHT;
    self.toolBarHeight=NAVBAR_HEIGHT;
    self.settingsHeight=MEASBAR_HEIGHT;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"presentSegueToMsgCVC"])
    {
        self.msgCVC = (MsgContainerViewController *)segue.destinationViewController;
        self.msgCVC.shareSettings = self.shareSettings;
        self.msgCVC.displayCVC = self;
    }
    if([segue.identifier isEqualToString:@"presentSegueToSystemCVC"])
    {
        self.systCVC = (SystemContainerViewController *)segue.destinationViewController;
        self.systCVC.shareSettings = self.shareSettings;
        self.systCVC.displayCVC = self;
    }
    if([segue.identifier isEqualToString:@"presentSegueToBarCVC"])
    {
        self.barCVC = (DisplaySettingsContainerViewController *)segue.destinationViewController;
        self.barCVC.shareSettings = self.shareSettings;
        self.barCVC.displayCVC = self;
        
        self.barCVC.frameWidth = self.frameWidth;
        self.barCVC.frameHeight = MEASBAR_HEIGHT;
        
        //[self.barCVC adjustMeasureBarWidth:NO];
    }
    if([segue.identifier isEqualToString:@"presentSegueToTraceCVC"])
    {
        self.traceCVC = (DisplayTracesContainerViewController *)segue.destinationViewController;
        self.traceCVC.shareSettings = self.shareSettings;
        self.traceCVC.displayCVC = self;
        
        self.traceCVC.frameWidth = self.frameWidth;
        self.traceCVC.frameHeight = self.frameHeight - MEASBAR_HEIGHT;
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
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.displayNavBar.frame = CGRectMake(0, 0, self.frameWidth, self.navBarHeight);
    self.displayToolBar.frame = CGRectMake(0, self.frameHeight-self.toolBarHeight, self.frameWidth, self.toolBarHeight);

    self.settingsV.frame = CGRectMake(0, self.navBarHeight, self.frameWidth, self.settingsHeight);
    self.tracesV.frame = CGRectMake(0, self.navBarHeight+self.settingsHeight, self.frameWidth, self.frameHeight-self.navBarHeight-self.toolBarHeight-self.settingsHeight);
}

- (IBAction)showHideMenu:(id)sender {
    [self hidePresetMenu];

    self.shareSettings.menuTapped=!self.shareSettings.menuTapped;
    if(self.shareSettings.menuTapped)
        [self.showHideMenuButton setImage:[UIImage imageNamed:@"HideMenu.png"] forState:UIControlStateNormal];
    else
        [self.showHideMenuButton setImage:[UIImage imageNamed:@"ShowMenu.png"] forState:UIControlStateNormal];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuTapped" object:nil];
}

- (IBAction)showMeasureView:(id)sender {
    //UIImage *screen = [self imageByRenderingView];
    
    self.shareSettings.measureTapped=!self.shareSettings.measureTapped;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"measureTapped" object:nil];
    
    /*
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"nav"];
    
    // present form sheet with view controller
    [self presentFormSheetWithViewController:vc animated:YES completionHandler:^(MSAFormSheetController *formSheetController) {
        //do sth
    }];
    */
}

- (IBAction)exitToHere:(UIStoryboardSegue *)sender {
    // Nothing to do here
}

/*
- (IBAction)transitionFromTop:(id)sender
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"nav"];
    
    // present form sheet with view controller
    [self presentFormSheetWithViewController:vc animated:YES completionHandler:^(MSAFormSheetController *formSheetController) {
        //do sth
    }];
}
*/

- (IBAction)showSystemView:(id)sender {
    //[self.mainCVC.displayCVC.barCVC setMeasureBarAccordingToFrame];
    [self hidePresetMenu];
}

- (IBAction)showMsgView:(id)sender {
    //[self.mainCVC.displayCVC.barCVC setMeasureBarAccordingToFrame];
    [self hidePresetMenu];
}

-(void)hidePresetMenu
{
    self.mainCVC.menuCVC.presetViewVisible = NO;
    [self.mainCVC.menuCVC showHidePresetMenu:self.mainCVC.menuCVC.presetViewVisible animated:YES];
}

/*
-(UIImage *)imageByRenderingViewOpaque:(BOOL)yesOrNo
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, yesOrNo, 0);
    if([self.view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:NO];
    }
    else
    {
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

-(UIImage *)imageByRenderingView
{
    return [self imageByRenderingViewOpaque:NO];
}
*/

@end
