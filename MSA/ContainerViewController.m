//
//  ContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "ContainerViewController.h"
#import "DisplayViewController.h"

@interface ContainerViewController ()

@end

#define VIEWCONTROLLER_DEFAULT_CORNER_RADIUS 3.0f
#define VIEWCONTROLLER_DEFAULT_BORDER_WIDTH 1.0f
#define MXA_MENU_VIEWCONTROLLER_WIDTH 240.0f

@implementation ContainerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.shareSettings = [ShareSettings sharedSettings];
    self.shareSettings.menuTapped=NO;
    self.shareSettings.barTapped=NO;
    self.shareSettings.msgTapped=NO;
    self.shareSettings.curMSALayout=MSA_DISP;
    self.shareSettings.prevMSALayout=MSA_DISP;
    
    //self.view.autoresizesSubviews = YES;
    
    //UIViewAutoresizing autoResizing = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    //UIViewAutoresizing autoResizing = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //self.displayVC.contentMode = UIViewContentModeScaleToFill;
    //self.displayVC.autoresizingMask = autoResizing;
    //self.displayVC.autoresizesSubviews = YES;
    //self.displayVC.clipsToBounds = YES;
    
    //self.displayVC.translatesAutoresizingMaskIntoConstraints = YES;
    
    self.displayView.layer.borderWidth = VIEWCONTROLLER_DEFAULT_BORDER_WIDTH;
    self.displayView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.displayView.layer.cornerRadius = VIEWCONTROLLER_DEFAULT_CORNER_RADIUS;

    self.menuView.layer.borderWidth = VIEWCONTROLLER_DEFAULT_BORDER_WIDTH;
    self.menuView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.menuView.layer.cornerRadius = VIEWCONTROLLER_DEFAULT_CORNER_RADIUS;

    //[self layoutVC:[self getVCLayoutType] animated:YES];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuTapped) name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barTapped) name:@"barTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(msgTapped) name:@"msgTapped" object:nil];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //[self layoutVC:[self getVCLayoutType] animated:YES];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self layoutVC:[self getMSALayout] animated:NO];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)menuTapped {
    [self layoutVC:[self getMSALayout] animated:YES];
    
    self.shareSettings.menuTapped=!self.shareSettings.menuTapped;
    
    /*
    if(self.shareSettings.menuTapped){
        [UIView animateWithDuration:0.3 animations:^{
            self.MainVC.frame = CGRectMake(0, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
            
            self.MenuVC.frame = CGRectMake(-260, self.MenuVC.frame.origin.y, self.MenuVC.frame.size.width, self.MenuVC.frame.size.height);
        }];
    } else{
        [UIView animateWithDuration:0.3 animations:^{
            self.MainVC.frame = CGRectMake(260, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
            
            self.MenuVC.frame = CGRectMake(0, self.MenuVC.frame.origin.y, self.MenuVC.frame.size.width, self.MenuVC.frame.size.height);
        }];
    }
    self.shareSettings.menuTapped=!self.shareSettings.menuTapped;
    */
}

-(void)barTapped{
    [self layoutVC:[self getMSALayout] animated:YES];
    
    self.shareSettings.barTapped=!self.shareSettings.barTapped;
    
    /*
     if(self.shareSettings.profileTapped){
     [UIView animateWithDuration:0.3 animations:^{
     self.MainVC.frame = CGRectMake(0, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
     
     self.ProfileVC.frame = CGRectMake(260, self.ProfileVC.frame.origin.y, self.ProfileVC.frame.size.width, self.ProfileVC.frame.size.height);
     }];
     } else{
     [UIView animateWithDuration:0.3 animations:^{
     self.MainVC.frame = CGRectMake(-260, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
     
     self.ProfileVC.frame = CGRectMake(0, self.ProfileVC.frame.origin.y, self.ProfileVC.frame.size.width, self.ProfileVC.frame.size.height);
     }];
     }
     self.shareSettings.profileTapped=!self.shareSettings.profileTapped;
     */
}

-(void)msgTapped{
    [self layoutVC:[self getMSALayout] animated:YES];
    
    self.shareSettings.msgTapped=!self.shareSettings.msgTapped;
    
    /*
     if(self.shareSettings.profileTapped){
     [UIView animateWithDuration:0.3 animations:^{
     self.MainVC.frame = CGRectMake(0, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
     
     self.ProfileVC.frame = CGRectMake(260, self.ProfileVC.frame.origin.y, self.ProfileVC.frame.size.width, self.ProfileVC.frame.size.height);
     }];
     } else{
     [UIView animateWithDuration:0.3 animations:^{
     self.MainVC.frame = CGRectMake(-260, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
     
     self.ProfileVC.frame = CGRectMake(0, self.ProfileVC.frame.origin.y, self.ProfileVC.frame.size.width, self.ProfileVC.frame.size.height);
     }];
     }
     self.shareSettings.profileTapped=!self.shareSettings.profileTapped;
     */
}

- (void)layoutVC:(MSALayout)layoutType animated:(BOOL)animated
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);

    self.shareSettings.prevMSALayout=self.shareSettings.curMSALayout;
    self.shareSettings.curMSALayout=layoutType;

    switch (layoutType) {
        default:
        case MSA_DISP:
            {
                layoutBlock = ^(void){
                    switch (self.shareSettings.prevMSALayout) {
                        //default:
                        case MSA_DISP:
                        case MSA_MENU:
                            {
                                self.menuView.frame = CGRectMake(self.view.frame.size.width, 0,
                                                               MXA_MENU_VIEWCONTROLLER_WIDTH, self.view.frame.size.height);
                                self.displayView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                            }
                            break;
                        case MSA_DISP_FULL:
                            {
                                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                           break;
                        case MSA_MENU_FULL:
                            {
                                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                        case MSA_MSG:
                            {
                                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                        default:
                            {
                                NSAssert(false, @"Error : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                    }
                
                    NSLog(@"ContainerVC Frame: %f, %f, %f, %f\nDisplayVC Frame: %f, %f, %f, %f\nMenuVC Frame: %f, %f, %f, %f",
                          self.view.frame.origin.x,
                          self.view.frame.origin.y,
                          self.view.frame.size.width,
                          self.view.frame.size.height,
                          self.displayView.frame.origin.x,
                          self.displayView.frame.origin.y,
                          self.displayView.frame.size.width,
                          self.displayView.frame.size.height,
                          self.menuView.frame.origin.x,
                          self.menuView.frame.origin.y,
                          self.menuView.frame.size.width,
                          self.menuView.frame.size.height);
                };
                completionBlock = ^(BOOL finished){
                };
            }
            break;
        case MSA_DISP_FULL:
            {
                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                         self.shareSettings.curMSALayout,
                         self.shareSettings.prevMSALayout);
            }
            break;
        case MSA_MENU:
            {
                layoutBlock = ^(void){
                    switch (self.shareSettings.prevMSALayout) {
                        case MSA_MENU:
                        case MSA_DISP:
                            {
                                self.menuView.frame = CGRectMake(self.view.frame.size.width-MXA_MENU_VIEWCONTROLLER_WIDTH, 0,
                                                               MXA_MENU_VIEWCONTROLLER_WIDTH, self.view.frame.size.height);
                                self.displayView.frame = CGRectMake(0, 0,
                                                                  self.view.frame.size.width-MXA_MENU_VIEWCONTROLLER_WIDTH, self.view.frame.size.height);
                            }
                            break;
                        case MSA_DISP_FULL:
                            {
                                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                        case MSA_MENU_FULL:
                            {
                                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                        case MSA_MSG:
                            {
                                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                        default:
                            {
                                NSAssert(false, @"Error : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                    }
                    
                    NSLog(@"ContainerVC Frame: %f, %f, %f, %f\nDisplayVC Frame: %f, %f, %f, %f\nMenuVC Frame: %f, %f, %f, %f",
                          self.view.frame.origin.x,
                          self.view.frame.origin.y,
                          self.view.frame.size.width,
                          self.view.frame.size.height,
                          self.displayView.frame.origin.x,
                          self.displayView.frame.origin.y,
                          self.displayView.frame.size.width,
                          self.displayView.frame.size.height,
                          self.menuView.frame.origin.x,
                          self.menuView.frame.origin.y,
                          self.menuView.frame.size.width,
                          self.menuView.frame.size.height);
                };
                completionBlock = ^(BOOL finished){
                };
            }
            break;
        case MSA_MENU_FULL:
            {
                NSAssert(false, @"Not Implemented : Current layout is %u while previous layout is %u",
                         self.shareSettings.curMSALayout,
                         self.shareSettings.prevMSALayout);
            }
            break;
    }

    if (animated)
    {
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionLayoutSubviews
                         animations:layoutBlock
                         completion:completionBlock];
    }
    else
    {
        layoutBlock();
        completionBlock(YES);
    }

    /*
    UIViewController *keyVC = [self.viewControllers objectAtIndex:0];
    UIViewController *displayVC = [self.viewControllers objectAtIndex:1];
    
    CGRect viewBounds = self.view.bounds;
    CGFloat keyWidth = self.usingCustomKeyWidth ? self.keyWidth : MOSAVIEWCONTROLLER_DEFAULT_KEY_WIDTH;
    
    if (!notCollapsed)
    {
        layoutBlock = ^(void){
            CGRect keyFrame = CGRectMake(viewBounds.size.width, 0, keyWidth+1.0, viewBounds.size.height);
            CGRect displayFrame = CGRectMake(0, 0, viewBounds.size.width, viewBounds.size.height);
            
            keyVC.view.frame = keyFrame;
            displayVC.view.frame = displayFrame;
        };
        
        completionBlock = ^(BOOL finished){
            [keyVC.view removeFromSuperview];
        };
    }
    else
    {
        if (keyVC.view.superview != self.view)
        {
            [self.view addSubview:keyVC.view];
        }
        //masterVC.view.frame = CGRectMake(-RZSPLITVIEWCONTROLLER_DEFAULT_MASTER_WIDTH, 0, RZSPLITVIEWCONTROLLER_DEFAULT_MASTER_WIDTH+1.0, viewBounds.size.height);
        
        keyVC.view.frame = CGRectMake(viewBounds.size.width, 0, keyWidth+1.0, viewBounds.size.height);
        
        layoutBlock = ^(void){
            CGRect keyFrame = CGRectMake(viewBounds.size.width-keyWidth, 0, keyWidth+1.0, viewBounds.size.height);
            CGRect displayFrame = CGRectMake(0, 0, viewBounds.size.width - keyWidth, viewBounds.size.height);
            
            keyVC.view.frame = keyFrame;
            displayVC.view.frame = displayFrame;
        };
        
        completionBlock = ^(BOOL finished){
            
        };
    }
    
    if (animated)
    {
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionLayoutSubviews
                         animations:layoutBlock
                         completion:completionBlock];
    }
    else
    {
        layoutBlock();
        completionBlock(YES);
    }
    */
}

-(MSALayout)getMSALayout {
    if(self.shareSettings.msgTapped==YES)
        return MSA_MSG;
    if(self.shareSettings.menuTapped==YES && self.shareSettings.barTapped==YES)
        return MSA_MENU_FULL;
    if(self.shareSettings.menuTapped==YES && self.shareSettings.barTapped==NO)
        return MSA_MENU;
    if(self.shareSettings.menuTapped==NO && self.shareSettings.barTapped==YES)
        return MSA_DISP_FULL;
    //if(self.shareSettings.menuTapped==NO && self.shareSettings.barTapped==NO)
    return MSA_DISP;
}

@end
