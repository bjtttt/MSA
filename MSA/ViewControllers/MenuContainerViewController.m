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
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"MenuContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToPresetMenuCVC"])
    {
        self.presetMenuCVC = (PresetMenuContainerViewController *)segue.destinationViewController;
        self.presetMenuCVC.shareSettings = self.shareSettings;
        self.presetMenuCVC.menuCVC = self;
        
        self.presetMenuCVC.frameHeight = self.frameHeight - NAVBAR_HEIGHT;
        self.presetMenuCVC.frameWidth = self.frameWidth;
    }
    if([segue.identifier isEqualToString:@"embedSegueToSoftMenuCVC"])
    {
        self.softMenuCVC = (SoftMenuContainerViewController *)segue.destinationViewController;
        self.softMenuCVC.shareSettings = self.shareSettings;
        self.softMenuCVC.menuCVC = self;
        
        self.presetMenuCVC.frameHeight = self.frameHeight - NAVBAR_HEIGHT;
        self.presetMenuCVC.frameWidth = self.frameWidth;
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //[self showHidePresetMenu:NO];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //[self showHidePresetMenu:NO];
    //[self.presetMenuV setHidden:YES];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //[self showHidePresetMenu:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

- (IBAction)showPresetMenu:(id)sender {
    //[self.presetMenuV setHidden:NO];
    [self showHidePresetMenu:YES];
}

- (void)showHidePresetMenu:(BOOL)showPresetMenu {
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);

    layoutBlock = ^(void){
        if(showPresetMenu == YES)
        {
            self.softMenuV.frame = CGRectMake(self.frameWidth, NAVBAR_HEIGHT, self.frameWidth, self.frameHeight-NAVBAR_HEIGHT);
            self.presetMenuV.frame = CGRectMake(0, NAVBAR_HEIGHT, self.frameWidth, self.frameHeight-NAVBAR_HEIGHT);
        }
        else
        {
            self.softMenuV.frame = CGRectMake(0, NAVBAR_HEIGHT, self.frameWidth, self.frameHeight-NAVBAR_HEIGHT);
            self.presetMenuV.frame = CGRectMake(self.frameWidth, NAVBAR_HEIGHT, self.frameWidth, self.frameHeight-NAVBAR_HEIGHT);
        }
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
