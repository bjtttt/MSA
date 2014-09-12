//
//  ContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "ContainerViewController.h"
#import "DisplayContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.frameWidth = self.view.frame.size.width;
    self.frameHeight = self.view.frame.size.height;
    
    self.shareSettings = [ShareSettings sharedSettings];
    self.shareSettings.menuTapped=NO;
    self.shareSettings.barTapped=NO;
    self.shareSettings.curMSALayout=MSA_DISP;
    self.shareSettings.prevMSALayout=MSA_DISP;
    //self.shareSettings.prevPrevMSALayout=MSA_DISP;
    
    //self.view.autoresizesSubviews = YES;
    
    //UIViewAutoresizing autoResizing = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    //UIViewAutoresizing autoResizing = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //self.displayVC.contentMode = UIViewContentModeScaleToFill;
    //self.displayVC.autoresizingMask = autoResizing;
    //self.displayVC.autoresizesSubviews = YES;
    //self.displayVC.clipsToBounds = YES;
    
    //self.displayVC.translatesAutoresizingMaskIntoConstraints = YES;
    
    //self.displayView.layer.borderWidth = VIEWCONTROLLER_DEFAULT_BORDER_WIDTH;
    //self.displayView.layer.borderColor = [[UIColor blackColor] CGColor];
    //self.displayView.layer.cornerRadius = VIEWCONTROLLER_DEFAULT_CORNER_RADIUS;
    self.displayCVC.shareSettings = self.shareSettings;

    //self.menuView.layer.borderWidth = VIEWCONTROLLER_DEFAULT_BORDER_WIDTH;
    //self.menuView.layer.borderColor = [[UIColor blackColor] CGColor];
    //self.menuView.layer.cornerRadius = VIEWCONTROLLER_DEFAULT_CORNER_RADIUS;

    //self.msgVC.shareSettings = self.shareSettings;

    //[self layoutVC:[self getVCLayoutType] animated:YES];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuTapped) name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barTapped) name:@"barTapped" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"barTapped" object:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToDisplayVC"])
        self.displayCVC = (DisplayContainerViewController *)segue.destinationViewController;
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
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
}

-(void)barTapped{
    [self layoutVC:[self getMSALayout] animated:YES];
}

-(void)msgTapped{
    [self layoutVC:[self getMSALayout] animated:YES];
}

- (void)layoutVC:(MSALayout)layoutType animated:(BOOL)animated
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);

    self.shareSettings.prevMSALayout=self.shareSettings.curMSALayout;
    self.shareSettings.curMSALayout=layoutType;

    switch (layoutType) {
        case MSA_DISP:
            {
                layoutBlock = ^(void){
                    switch (self.shareSettings.prevMSALayout) {
                        case MSA_DISP:
                            // Startup State
                        case MSA_MENU:
                            {
                                self.menuView.frame = CGRectMake(self.frameWidth, 0, MENU_WIDTH, self.frameHeight);
                                self.displayView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
                                //self.msgView.frame = CGRectMake(0, self.frameHeight, self.frameWidth, self.frameHeight);
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
                        default:
                            {
                                NSAssert(false, @"Error : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                    }
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
                                self.menuView.frame = CGRectMake(self.frameWidth-MENU_WIDTH, 0, MENU_WIDTH, self.frameHeight);
                                self.displayView.frame = CGRectMake(0, 0, self.frameWidth-MENU_WIDTH, self.frameHeight);
                                //self.msgView.frame = CGRectMake(0, self.frameHeight, self.frameWidth, self.frameHeight);
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
                        default:
                            {
                                NSAssert(false, @"Error : Current layout is %u while previous layout is %u",
                                         self.shareSettings.curMSALayout,
                                         self.shareSettings.prevMSALayout);
                            }
                            break;
                    }
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
        default:
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
                              //delay:0
                            //options:UIViewAnimationOptionLayoutSubviews
                         animations:layoutBlock
                         completion:completionBlock];
    }
    else
    {
        layoutBlock();
        completionBlock(YES);
    }
}

-(MSALayout)getMSALayout {
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
