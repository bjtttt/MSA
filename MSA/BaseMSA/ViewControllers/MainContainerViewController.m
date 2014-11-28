//
//  MainContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "ParameterManager.h"
#import "ModeManager.h"
#import "MainContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "MenuContainerViewController.h"
#import "MeasureContainerViewController.h"
#import "MeasureBarContainerViewController.h"
#import "BlurViewController.h"
#import "BarPopupMenuContainerViewController.h"
#import "UIView+Screenshot.h"
#import "MainContainerView.h"
#import "SoftMenuContainerViewController.h"
#import "PresetMenuContainerViewController.h"

@interface MainContainerViewController ()

@end

@implementation MainContainerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    if(self.mainView.barCV == nil)
        self.mainView.barCV = self.displayCVC.barV;
}

-(void)setMeasureViewStyle
{
    // Measure View Border Radius
    [self.measureView.layer setCornerRadius:HEAVY_CORNER_RADIUS];
    [self.measureView.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    
    // Measure View Border
    [self.measureView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.measureView.layer setBorderWidth:HEAVY_BORDER_WIDTH];
    
    // Measure View Border Shadow
    [self.measureView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.measureView.layer setShadowOpacity:1.0];
    [self.measureView.layer setShadowRadius:HEAVY_CORNER_RADIUS];
    [self.measureView.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
    [self.measureView.layer setShadowPath:[[UIBezierPath bezierPathWithRect:self.measureView.layer.bounds] CGPath]];
}

-(void)setBarPopupMenuViewStyle
{
    // Bar View Border Radius
    //[self.barPopupMenuView.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.barPopupMenuView.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    
    // Bar View Border
    [self.barPopupMenuView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.barPopupMenuView.layer setBorderWidth:NORMAL_BORDER_WIDTH];
}

-(void) loadView {
    //NSLog(@"ContainerViewController - loadView");
    
    [super loadView];
        
    self.frameWidth = self.view.frame.size.width;
    self.frameHeight = self.view.frame.size.height;

    self.shareSettings = [[ShareSettings alloc] init];
    self.shareSettings.menuTapped=NO;
    self.shareSettings.measureTapped=NO;
    //self.shareSettings.barTapped=NO;
    self.shareSettings.menuDisplayed=NO;
    self.shareSettings.measureDisplayed=NO;
    self.shareSettings.barPopupMenuDisplayed=NO;
    
    self.shareSettings.barTappedIndex = -1;
    self.shareSettings.currentBarPopupMenuIndex = -1;
    self.shareSettings.previousBarPopupMenuIndex = -1;

    self.shareSettings.barPopupMenuAreaTapped=NO;
    self.shareSettings.navPresetMenuButtonAreaTapped=NO;

    self.shareSettings.currentInstrument = [[NSMutableString alloc] initWithString:@""];
    self.shareSettings.currentInstrumentStatus = INST_DISC;
    
    self.shareSettings.modeStoryboard = self.modeStoryboard;
    
    //self.shareSettings.dataParameters = [[NSDictionary alloc] init];
    self.shareSettings.parManager = [[ParameterManager alloc] init];
    
    self.shareSettings.prevMeasure = [[NSMutableString alloc] initWithString:@""];
    self.shareSettings.curMeasure = [[NSMutableString alloc] initWithString:@""];
    
    [self.shareSettings initMeasureView];
    //[self.shareSettings initMeasureBar];
    [self.shareSettings initSoftMenuSystem];
    
    NSAssert(self.parManager == nil, @"ParameterManager is NOT nil");
    
    // Must be initialized after initSoftMenuSystem because we can get the data name string
    self.parManager = [[ParameterManager alloc] init];
    self.parManager.shareSettings=self.shareSettings;
    [self.parManager parseParameter];
    [self.parManager registerParameterChangedEvent];

    NSAssert(self.modeManager == nil, @"ParameterManager is NOT nil");
    self.modeManager = [[ModeManager alloc] init];
    self.modeManager.shareSettings = self.shareSettings;
    [self.modeManager initMode];
    [self.modeManager initMenuSystem];

    UIStoryboard *modeUIS = [UIStoryboard storyboardWithName:@"Mode" bundle:nil];
    self.shareSettings.modeStoryboard = modeUIS;
    MeasureBarContainerViewController *mbarCVC = (MeasureBarContainerViewController *)[modeUIS instantiateViewControllerWithIdentifier:@"measureBarCVC"];
    NSAssert([mbarCVC isKindOfClass:[MeasureBarContainerViewController class]], @"mbarCVC should be MeasureBarContainerViewController.");
    mbarCVC.frameWidth = self.frameWidth;
    mbarCVC.frameHeight = BAR_HEIGHT;
    mbarCVC.shareSettings = self.shareSettings;
    mbarCVC.displayCVC = self.displayCVC;
    self.shareSettings.barCVC = mbarCVC;
    self.barCVC = mbarCVC;
    ((MainContainerView *)self.mainView).shareSettings = self.shareSettings;
    
    // Border Radius
    //[self.menuView.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.menuView.layer setMasksToBounds:YES];
    //[self.menuView setClipsToBounds:YES];
    // Border
    [self.menuView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.menuView.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    // Background
    //[self.menuView.layer setBackgroundColor:[UIColor darkGrayColor].CGColor];
        
    [self setMeasureViewStyle];
    [self setBarPopupMenuViewStyle];
    
    self.mainView.sendNotification = YES;
}

-(void) viewWillAppear:(BOOL)animated{
    //[self layoutVC:[self getMSALayout] animated:NO];
}

-(void)viewDidAppear:(BOOL)animated {
    //NSLog(@"ContainerViewController - viewDidAppear");

    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuTapped) name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(measureTapped) name:@"measureTapped" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barTappedIndex) name:@"barTappedIndex" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barPopupMenuAreaTapped) name:@"barPopupMenuAreaTapped" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    //NSLog(@"ContainerViewController - viewDidDisappear");

    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"measureTapped" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"barTappedIndex" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"barPopupMenuAreaTapped" object:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"ContainerViewController - prepareForSegue");

    if([segue.identifier isEqualToString:@"embedSegueToDisplayVC"])
    {
        self.displayCVC = (DisplayContainerViewController *)segue.destinationViewController;
        self.displayCVC.shareSettings = self.shareSettings;
        self.displayCVC.mainCVC = self;
        
        self.displayCVC.frameWidth = self.frameWidth;
        self.displayCVC.frameHeight = self.frameHeight;

        //self.mainView.barCV = self.displayCVC.barV;
    }
    if([segue.identifier isEqualToString:@"embedSegueToMenuVC"])
    {
        self.menuCVC = (MenuContainerViewController *)segue.destinationViewController;
        self.menuCVC.shareSettings = self.shareSettings;
        self.menuCVC.mainCVC = self;
        
        self.menuCVC.frameWidth = MENU_WIDTH;
        self.menuCVC.frameHeight = self.frameHeight;

        //self.menuView.frame = CGRectMake(self.menuView.frame.origin.x, self.menuView.frame.origin.y, MENU_WIDTH, self.frameHeight);
        //self.menuCVC.softMenuV.frame = CGRectMake(self.menuCVC.softMenuV.frame.origin.x, self.menuCVC.softMenuV.frame.origin.y, MENU_WIDTH, self.frameHeight);
    }
    if([segue.identifier isEqualToString:@"embedSegueToMeasureVC"])
    {
        self.measureCVC = (MeasureContainerViewController *)segue.destinationViewController;
        self.measureCVC.shareSettings = self.shareSettings;
        self.measureCVC.mainCVC = self;
        
        self.measureCVC.frameWidth = MENU_WIDTH;
        self.measureCVC.frameHeight = self.frameHeight;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBarPopupMenuCVC"])
    {
        self.barPopupMenuCVC = (BarPopupMenuContainerViewController *)segue.destinationViewController;
        self.barPopupMenuCVC.shareSettings = self.shareSettings;
        self.barPopupMenuCVC.mainCVC = self;
        
        self.barPopupMenuCVC.frameWidth = MENU_WIDTH;
        self.barPopupMenuCVC.frameHeight = BAR_MENU_HEIGHT;
        
        self.barCVC.barPopupMenuCVC = self.barPopupMenuCVC;
        [self.barCVC setBarPopupMenuViewController:self.barPopupMenuCVC];
        
        ((MainContainerView *)self.mainView).barPopupMenuV = self.barPopupMenuCVC.view;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBlurVC"])
    {
        self.blurVC = (BlurViewController *)segue.destinationViewController;
        self.blurVC.shareSettings = self.shareSettings;
        self.blurVC.mainCVC = self;
        
        self.blurVC.frameWidth = self.frameWidth;
        self.blurVC.frameHeight = self.frameHeight;
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
    
    [self layoutVC:NO];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)menuTapped {
    self.shareSettings.menuDisplayed = !self.shareSettings.menuDisplayed;
    [self layoutVC:YES];
}

- (void)measureTapped {
    self.shareSettings.measureDisplayed = !self.shareSettings.measureDisplayed;
    [self layoutVC:YES];
}

-(void)barTappedIndex {
    [self layoutVC:YES];
}

- (void)barPopupMenuAreaTapped {
    [self layoutVC:YES];
}

- (void)layoutVC:(BOOL)animated
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
 
    UIImage *img = nil;
    UIImage *blurImg = nil;
    
    //int currentTappedIndex = self.shareSettings.barTappedIndex;
    
    CGFloat displayWidth = 0.0f;
    if(self.shareSettings.menuDisplayed == YES)
        displayWidth = self.frameWidth - MENU_WIDTH;
    else
        displayWidth = self.frameWidth;
    CGFloat barMenuPosition = [self.shareSettings measureBarPopupMenuPosition:self.shareSettings.barTappedIndex forWidth:displayWidth];
    
    if(self.shareSettings.presetMenuDisplayed == YES)
    {
        if(self.shareSettings.presetMenuAreaTapped == NO)
        {
            self.menuCVC.presetViewVisible = NO;
            [self.menuCVC showHidePresetMenu:NO animated:YES];
        }
    }
    else
    {
        if(self.shareSettings.menuDisplayed == YES)
        {
            if(self.shareSettings.navPresetMenuButtonAreaTapped == YES)
            {
                self.menuCVC.presetViewVisible = YES;
                [self.menuCVC showHidePresetMenu:YES animated:YES];
            }
        }
    }

    if(self.shareSettings.barPopupMenuAreaTapped == NO)
    {
        if(self.shareSettings.barTappedIndex == -1)
        {
            barMenuPosition = [self.shareSettings measureBarPopupMenuPosition:self.shareSettings.previousBarPopupMenuIndex forWidth:displayWidth];
            
            layoutBlock = ^(void)
            {
                self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);
            };
            completionBlock = ^(BOOL finished){
            };
            
            self.shareSettings.currentBarPopupMenuIndex = -1;
            self.shareSettings.barPopupMenuDisplayed = NO;
        }
        else
        {
            /*
            if(self.shareSettings.menuDisplayed == YES)
            {
                self.menuCVC.presetViewVisible = NO;
                [self.menuCVC showHidePresetMenu:NO animated:YES];
            }
            */

            if (self.shareSettings.currentBarPopupMenuIndex == -1)
            {
                // Bar Popup Menu isn't displayed
                self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);
                
                layoutBlock = ^(void)
                {
                    self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, MENU_WIDTH, BAR_MENU_HEIGHT);
                };
                completionBlock = ^(BOOL finished){
                };
                
                self.shareSettings.currentBarPopupMenuIndex = self.shareSettings.barTappedIndex;
                self.shareSettings.barPopupMenuDisplayed = YES;
                self.shareSettings.previousBarPopupMenuIndex = self.shareSettings.barTappedIndex;
            }
            else
            {
                if(self.shareSettings.currentBarPopupMenuIndex != self.shareSettings.barTappedIndex)
                {
                    layoutBlock = ^(void)
                    {
                        self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, MENU_WIDTH, BAR_MENU_HEIGHT);
                    };
                    completionBlock = ^(BOOL finished){
                    };
                    
                    self.shareSettings.currentBarPopupMenuIndex = self.shareSettings.barTappedIndex;
                    self.shareSettings.barPopupMenuDisplayed = YES;
                    self.shareSettings.previousBarPopupMenuIndex = self.shareSettings.barTappedIndex;
                }
                else
                {
                    layoutBlock = ^(void)
                    {
                        self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);
                    };
                    completionBlock = ^(BOOL finished){
                    };
                    
                    self.shareSettings.currentBarPopupMenuIndex = -1;
                    self.shareSettings.barPopupMenuDisplayed = NO;
                }
            }
        }
    
        if (animated)
        {
            [UIView animateWithDuration:0.1
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
    
    NSAssert(!(self.shareSettings.barPopupMenuDisplayed == YES && self.shareSettings.measureDisplayed == YES), @"ERROR : Bar PopupMenu and Measure Select are both YES!");
    
    if(self.shareSettings.measureDisplayed == YES)
    {
        // Show Connect Instrument and Select Measure/View
        
        if(self.shareSettings.menuDisplayed == YES)
        {
            self.menuCVC.presetViewVisible = NO;
            [self.menuCVC showHidePresetMenu:NO animated:NO];
        }

        img = [self.view convertViewToImage];
        blurImg = [self.shareSettings blurryImage:img];
        
        layoutBlock = ^(void)
        {
            self.measureView.frame = CGRectMake((self.frameWidth-MEAS_WIDTH)/2, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
        };
        completionBlock = ^(BOOL finished){
        };
    }
    if(self.shareSettings.barPopupMenuDisplayed == NO && self.shareSettings.measureDisplayed == NO)
    {
        self.blurView.frame = CGRectMake(-self.frameWidth-VC_MARGIN, 0, self.frameWidth, self.frameHeight);
        
        if(self.shareSettings.menuDisplayed == YES)
        {
            self.displayCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            self.displayCVC.frameHeight = self.frameHeight;
            self.displayCVC.barCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            
            self.barCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            [self.barCVC adjustMeasureBarWidth:YES];
            
            //[self.menuCVC.softMenuCVC setSoftMenuFrame];
            
            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MEAS_WIDTH-VC_MARGIN, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
                self.menuView.frame = CGRectMake(self.frameWidth-MENU_WIDTH, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth-MENU_WIDTH, self.frameHeight);
            };
            completionBlock = ^(BOOL finished){
            };
        }
        else
        {
            self.displayCVC.frameWidth = self.frameWidth;
            self.displayCVC.frameHeight = self.frameHeight;
            self.displayCVC.barCVC.frameWidth = self.frameWidth;
            
            self.barCVC.frameWidth = self.frameWidth;
            [self.barCVC adjustMeasureBarWidth:YES];

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MEAS_WIDTH-VC_MARGIN, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
                self.menuView.frame = CGRectMake(self.frameWidth+VC_MARGIN, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
            };
            completionBlock = ^(BOOL finished){
            };
        }
    }
    
    self.shareSettings.barPopupMenuCGRect = CGRectMake(self.barPopupMenuView.frame.origin.x, self.barPopupMenuView.frame.origin.y, self.barPopupMenuView.frame.size.width, self.barPopupMenuView.frame.size.height);
    self.shareSettings.barCGRect = CGRectMake(0, NAVBAR_HEIGHT, self.displayView.frame.size.width, BAR_HEIGHT);
    if(self.shareSettings.menuDisplayed == YES)
    {
        self.shareSettings.navBarPresetMenuButtonCGRect = CGRectMake(self.frameWidth - MENU_WIDTH + self.menuCVC.navBarPresetMenuBI.customView.frame.origin.x, self.menuCVC.navBarPresetMenuBI.customView.frame.origin.y, self.menuCVC.navBarPresetMenuBI.customView.frame.size.width, self.menuCVC.navBarPresetMenuBI.customView.frame.size.height);
        self.shareSettings.presetMenuCGRect = CGRectMake(self.frameWidth - MENU_WIDTH, NAVBAR_HEIGHT, self.menuCVC.presetMenuCVC.view.frame.size.width, self.menuCVC.presetMenuCVC.view.frame.size.height);
    }
    else
    {
        self.shareSettings.navBarPresetMenuButtonCGRect = CGRectMake(self.frameWidth + self.menuCVC.navBarPresetMenuBI.customView.frame.origin.x, self.menuCVC.navBarPresetMenuBI.customView.frame.origin.y, self.menuCVC.navBarPresetMenuBI.customView.frame.size.width, self.menuCVC.navBarPresetMenuBI.customView.frame.size.height);
        self.shareSettings.presetMenuCGRect = CGRectMake(self.frameWidth - MENU_WIDTH, NAVBAR_HEIGHT, self.menuCVC.presetMenuCVC.view.frame.size.width, self.menuCVC.presetMenuCVC.view.frame.size.height);
    }
    //NSLog(@"SET Measure Bar Popup Menu Rect : x = %f, y = %f, width = %f, height = %f", self.shareSettings.barPopupMenuCGRect.origin.x, self.shareSettings.barPopupMenuCGRect.origin.y, self.shareSettings.barPopupMenuCGRect.size.width, self.shareSettings.barPopupMenuCGRect.size.height);
    //NSLog(@"SET Measure Bar Rect : x = %f, y = %f, width = %f, height = %f", self.shareSettings.barCGRect.origin.x, self.shareSettings.barCGRect.origin.y, self.shareSettings.barCGRect.size.width, self.shareSettings.barCGRect.size.height);
    //NSLog(@"SET Nav Bar Preset Menu Button Rect : x = %f, y = %f, width = %f, height = %f", self.shareSettings.navBarPresetMenuButtonCGRect.origin.x, self.shareSettings.navBarPresetMenuButtonCGRect.origin.y, self.shareSettings.navBarPresetMenuButtonCGRect.size.width, self.shareSettings.navBarPresetMenuButtonCGRect.size.height);
    
    if (animated)
    {
        [UIView animateWithDuration:0.1
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
    
    if(self.shareSettings.measureDisplayed == YES)
    {
        self.blurView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
        [self.blurVC.blurImage setImage:blurImg];
    }
}

@end