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

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    [super prepareForSegue:segue sender:sender];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //self.displayNavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
 
    /*
    NSLog(@"Display viewDidLoad\nDisplayVC Frame :  %f, %f, %f, %f\nDisplayVC NavBar Frame: %f, %f, %f, %f",
          self.view.frame.origin.x,
          self.view.frame.origin.y,
          self.view.frame.size.width,
          self.view.frame.size.height,
          self.displayNavBar.frame.origin.x,
          self.displayNavBar.frame.origin.y,
          self.displayNavBar.frame.size.width,
          self.displayNavBar.frame.size.height);
    */
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
    
    //self.displayNavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, self.displayNavBar.frame.size.height);

    //NSLog(@"viewWillLayoutSubviews\nDisplayVC NavBar Frame: %f, %f, %f, %f",
    //      self.displayNavBar.frame.origin.x,
    //      self.displayNavBar.frame.origin.y,
    //      self.displayNavBar.frame.size.width,
    //      self.displayNavBar.frame.size.height);
    
    /*
    NSLog(@"Display viewWillLayoutSubviews\nDisplayVC Frame :  %f, %f, %f, %f\nDisplayVC NavBar Frame: %f, %f, %f, %f",
          self.view.frame.origin.x,
          self.view.frame.origin.y,
          self.view.frame.size.width,
          self.view.frame.size.height,
          self.displayNavBar.frame.origin.x,
          self.displayNavBar.frame.origin.y,
          self.displayNavBar.frame.size.width,
          self.displayNavBar.frame.size.height);
    */
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.displayNavBar.frame = CGRectMake(0, 0, self.view.frame.size.width, self.displayNavBar.frame.size.height);
    self.displayToolBar.frame = CGRectMake(0, self.view.frame.size.height-self.displayToolBar.frame.size.height,
                                           self.view.frame.size.width, self.displayToolBar.frame.size.height);
    
    /*
    NSLog(@"Display viewDidLayoutSubviews\nDisplayVC Frame :  %f, %f, %f, %f\nDisplayVC NavBar Frame: %f, %f, %f, %f",
          self.view.frame.origin.x,
          self.view.frame.origin.y,
          self.view.frame.size.width,
          self.view.frame.size.height,
          self.displayNavBar.frame.origin.x,
          self.displayNavBar.frame.origin.y,
          self.displayNavBar.frame.size.width,
          self.displayNavBar.frame.size.height);
    */
}

- (IBAction)showHideMenu:(id)sender {
    self.shareSettings.menuTapped=!self.shareSettings.menuTapped;
    if(self.shareSettings.menuTapped)
        [self.showHideMenuButton setImage:[UIImage imageNamed:@"HideMenu.png"] forState:UIControlStateNormal];
    else
        [self.showHideMenuButton setImage:[UIImage imageNamed:@"ShowMenu.png"] forState:UIControlStateNormal];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuTapped" object:nil];
}

- (IBAction)showHideMsg:(id)sender {
    self.shareSettings.msgTapped=!self.shareSettings.msgTapped;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"msgTapped" object:nil];
}

@end
