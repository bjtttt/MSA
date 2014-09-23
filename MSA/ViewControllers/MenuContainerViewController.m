//
//  MenuContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "MenuContainerViewController.h"
#import "PresetMenuContainerViewController.h"
#import "SoftMenuContainerViewController.h"

@interface MenuContainerViewController ()

@end

@implementation MenuContainerViewController

-(void)loadView {
    self.navBarHeight = NAVBAR_HEIGHT;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.layer.borderWidth = BORDER_WIDTH;
    //self.view.layer.borderColor = [[UIColor blackColor] CGColor];
    
    //self.navBarHeight=self.menuNavBar.frame.size.height;
    //self.frameWidth=self.view.frame.size.width;
    //self.frameHeight=self.view.frame.size.height;

    //NSLog(@"\nMenuContainerViewController :\nnavBarHeight = %f,\nframeWidth = %f,\nframeHeight = %f\nx = %f,\ny = %f",
    //      self.navBarHeight, self.frameWidth, self.frameHeight, self.view.frame.origin.x, self.view.frame.origin.y);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToPresetMenuCVC"])
    {
        self.presetMenuCVC = (PresetMenuContainerViewController *)segue.destinationViewController;
        self.presetMenuCVC.shareSettings = self.shareSettings;
        self.presetMenuCVC.menuCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToSoftMenuCVC"])
    {
        self.softMenuCVC = (SoftMenuContainerViewController *)segue.destinationViewController;
        self.softMenuCVC.shareSettings = self.shareSettings;
        self.softMenuCVC.menuCVC = self;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [self showHidePresetMenu:NO];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.navBarHeight=self.menuNavBar.frame.size.height;
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
    
    NSLog(@"\nMenuContainerViewController :\nnavBarHeight = %f,\nframeWidth = %f,\nframeHeight = %f\nx = %f,\ny = %f",
          self.navBarHeight, self.frameWidth, self.frameHeight, self.view.frame.origin.x, self.view.frame.origin.y);
    
    //NSLog(@"Frame :\nx = %f,\ny = %f,\nwidth = %f,\nheight = %f",
    //      self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    //[self showHidePresetMenu:NO];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //self.tabBar.frame=CGRectMake(0, self.tabBar.frame.origin.y,self.tabBar.frame.size.width,self.tabBar.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

- (IBAction)showPresetMenu:(id)sender {
    [self showHidePresetMenu:YES];
}

- (void)showHidePresetMenu:(BOOL)showPresetMenu {
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    //NSLog(@"Frame :\nx = %f,\ny = %f,\nwidth = %f,\nheight = %f",
    //      self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);

    layoutBlock = ^(void){
        //NSLog(@"Before Layout\nSoft Menu View :\nx = %f,\ny = %f,\nwidth = %f,\nheight = %f\nPreset Menu View :\nx = %f,\ny = %f,\nwidth = %f,\nheight = %f",
        //      self.softMenuV.frame.origin.x, self.softMenuV.frame.origin.y, self.softMenuV.frame.size.width, self.softMenuV.frame.size.height, self.presetMenuV.frame.origin.x, self.presetMenuV.frame.origin.y, self.presetMenuV.frame.size.width, self.presetMenuV.frame.size.height);

        if(showPresetMenu == YES)
        {
            self.softMenuV.frame = CGRectMake(self.frameWidth, self.navBarHeight, self.frameWidth, self.frameHeight-self.navBarHeight);
            self.presetMenuV.frame = CGRectMake(0, self.navBarHeight, self.frameWidth, self.frameHeight);
        }
        else
        {
            self.softMenuV.frame = CGRectMake(0, self.navBarHeight, self.frameWidth, self.frameHeight-self.navBarHeight);
            self.presetMenuV.frame = CGRectMake(self.frameWidth, self.navBarHeight, self.frameWidth, self.frameHeight);
        }
        
        //NSLog(@"After Layout\nSoft Menu View :\nx = %f,\ny = %f,\nwidth = %f,\nheight = %f\nPreset Menu View :\nx = %f,\ny = %f,\nwidth = %f,\nheight = %f",
        //      self.softMenuV.frame.origin.x, self.softMenuV.frame.origin.y, self.softMenuV.frame.size.width, self.softMenuV.frame.size.height, self.presetMenuV.frame.origin.x, self.presetMenuV.frame.origin.y, self.presetMenuV.frame.size.width, self.presetMenuV.frame.size.height);
    };
    completionBlock = ^(BOOL finished){
    };
    
    [UIView animateWithDuration:0.25
                     //delay:0
                     //options:UIViewAnimationOptionLayoutSubviews
                     animations:layoutBlock
                     completion:completionBlock];
}

@end
