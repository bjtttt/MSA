//
//  DisplayViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //self.displayNavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
 
    //NSLog(@"viewDidLoad\nDisplayVC NavBar Frame: %f, %f, %f, %f",
    //      self.displayNavBar.frame.origin.x,
    //      self.displayNavBar.frame.origin.y,
    //      self.displayNavBar.frame.size.width,
    //      self.displayNavBar.frame.size.height);
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
    
    //NSLog(@"viewWillLayoutSubviews\nDisplayVC NavBar Frame: %f, %f, %f, %f",
    //      self.displayNavBar.frame.origin.x,
    //      self.displayNavBar.frame.origin.y,
    //      self.displayNavBar.frame.size.width,
    //      self.displayNavBar.frame.size.height);
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.displayNavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, self.displayNavBar.frame.size.height);
    
    NSLog(@"viewDidLayoutSubviews\nDisplayVC NavigationBar Frame: %f, %f, %f, %f",
          self.displayNavBar.frame.origin.x,
          self.displayNavBar.frame.origin.y,
          self.displayNavBar.frame.size.width,
          self.displayNavBar.frame.size.height);
}

- (IBAction)showHideMenu:(id)sender {
    self.shareSettings.menuTapped=!self.shareSettings.menuTapped;
}

@end
