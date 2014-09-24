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
#import "MenuContainerViewController.h"
#import "MeasureContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.frameWidth = self.view.frame.size.width;
    self.frameHeight = self.view.frame.size.height;
    
    //self.shareSettings = [ShareSettings sharedSettings];
    //self.shareSettings.menuTapped=NO;
    //self.shareSettings.barTapped=NO;
    //self.shareSettings.curMSALayout=MSA_DISP;
    //self.shareSettings.prevMSALayout=MSA_DISP;
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
    //self.displayCVC.shareSettings = self.shareSettings;

    //self.menuView.layer.borderWidth = VIEWCONTROLLER_DEFAULT_BORDER_WIDTH;
    //self.menuView.layer.borderColor = [[UIColor blackColor] CGColor];
    //self.menuView.layer.cornerRadius = VIEWCONTROLLER_DEFAULT_CORNER_RADIUS;

    //self.msgVC.shareSettings = self.shareSettings;

    //[self layoutVC:[self getVCLayoutType] animated:YES];
}

-(void) loadView {
    NSLog(@"ContainerViewController - loadView");
    
    [super loadView];
    
    self.frameWidth = self.view.frame.size.width;
    self.frameHeight = self.view.frame.size.height;

    self.shareSettings = [ShareSettings sharedSettings];
    self.shareSettings.menuTapped=NO;
    //self.shareSettings.barTapped=NO;
    self.shareSettings.menuDisplayed=NO;
    self.shareSettings.measureDisplayed=NO;
    //self.shareSettings.prevprevMSALayout=MSA_DISP;

    //[self.menuView setHidden:YES];
    //[self.menuCVC showHidePresetMenu:YES];
    //[self layoutVC:[self getMSALayout] animated:NO];
}

-(void) viewWillAppear:(BOOL)animated{
    //[self layoutVC:[self getMSALayout] animated:NO];
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"ContainerViewController - viewDidAppear");

    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuTapped) name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barTapped) name:@"barTapped" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    NSLog(@"ContainerViewController - viewDidDisappear");

    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"menuTapped" object:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"ContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToDisplayVC"])
    {
        self.displayCVC = (DisplayContainerViewController *)segue.destinationViewController;
        self.displayCVC.shareSettings = self.shareSettings;
        self.displayCVC.mainCVC = self;
        
        self.displayCVC.frameWidth = self.frameWidth;
        self.displayCVC.frameHeight = self.frameHeight;
    }
    if([segue.identifier isEqualToString:@"embedSegueToMenuVC"])
    {
        self.menuCVC = (MenuContainerViewController *)segue.destinationViewController;
        self.menuCVC.shareSettings = self.shareSettings;
        self.menuCVC.mainCVC = self;
        
        self.menuCVC.frameWidth = MENU_WIDTH;
        self.menuCVC.frameHeight = self.frameHeight;
    }
    if([segue.identifier isEqualToString:@"embedSegueToMeasureVC"])
    {
        self.measureCVC = (MeasureContainerViewController *)segue.destinationViewController;
        self.measureCVC.shareSettings = self.shareSettings;
        self.measureCVC.mainCVC = self;
        
        self.measureCVC.frameWidth = MENU_WIDTH;
        self.measureCVC.frameHeight = self.frameHeight;
    }
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    //[self.menuCVC showHidePresetMenu:YES];
    //[self layoutVC:[self getMSALayout] animated:NO];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //[self.menuView setHidden:NO];
    [self layoutVC:NO];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)menuTapped {
    //[self.menuView setHidden:NO];
    
    //[self.menuCVC showHidePresetMenu:YES]
    
    self.shareSettings.menuDisplayed = !self.shareSettings.menuDisplayed;
    
    [self layoutVC:YES];
}

- (void)layoutVC:(BOOL)animated
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);

    //self.shareSettings.prevprevMSALayout=self.shareSettings.prevMSALayout;
    //self.shareSettings.prevMSALayout=self.shareSettings.curMSALayout;
    //self.shareSettings.curMSALayout=layoutType;
    
    if(self.shareSettings.measureDisplayed == YES)
    {
        if(self.shareSettings.menuDisplayed == YES)
        {
            
        }
        else
        {
            
        }
    }
    else
    {
        if(self.shareSettings.menuDisplayed == YES)
        {
            self.displayCVC.frameWidth = self.frameWidth;
            self.displayCVC.frameHeight = self.frameHeight;

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MENU_WIDTH, 0, MENU_WIDTH, self.frameHeight);
                self.menuView.frame = CGRectMake(self.frameWidth-MENU_WIDTH, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth-MENU_WIDTH, self.frameHeight);
            };
            completionBlock = ^(BOOL finished){
            };
        }
        else
        {
            self.displayCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            self.displayCVC.frameHeight = self.frameHeight;

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MENU_WIDTH-VC_MARGIN, 0, MENU_WIDTH, self.frameHeight);
                self.menuView.frame = CGRectMake(self.frameWidth+VC_MARGIN, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
            };
            completionBlock = ^(BOOL finished){
            };
        }
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

/*
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
*/

@end
