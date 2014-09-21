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
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.layer.borderWidth = BORDER_WIDTH;
    //self.view.layer.borderColor = [[UIColor blackColor] CGColor];
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

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.navBarHeight=self.menuNavBar.frame.size.height;
    self.frameWidth=self.view.frame.size.width;
    self.frameHeight=self.view.frame.size.height;
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
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    layoutBlock = ^(void){
        self.presetMenuV.frame = CGRectMake(0, self.navBarHeight, self.frameWidth, self.frameHeight-self.navBarHeight);
        self.softMenuV.frame = CGRectMake(0, self.frameWidth, self.frameWidth, self.frameHeight-self.navBarHeight);
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
