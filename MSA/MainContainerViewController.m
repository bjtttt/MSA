//
//  ContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "ParameterManager.h"
#import "MainContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "MenuContainerViewController.h"
#import "MeasureContainerViewController.h"
#import "MeasureBarContainerViewController.h"
#import "BlurViewController.h"
#import "BarPopupMenuTableViewController.h"
#import "UIView+Screenshot.h"
#import "MainContainerView.h"

@interface MainContainerViewController ()

@end

@implementation MainContainerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.frameWidth = self.view.frame.size.width;
    self.frameHeight = self.view.frame.size.height;
    
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
    
    // Bar View Border Radius
    [self.barPopupMenuView.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.barPopupMenuView.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    
    // Bar View Border
    [self.barPopupMenuView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.barPopupMenuView.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    
    if(((MainContainerView *)self.mainView).barV == nil)
        ((MainContainerView *)self.mainView).barV = self.displayCVC.barV;

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
    self.shareSettings.measureTapped=NO;
    //self.shareSettings.barTapped=NO;
    self.shareSettings.menuDisplayed=NO;
    self.shareSettings.measureDisplayed=NO;
    self.shareSettings.barPopupMenuDisplayed=NO;
    
    self.shareSettings.barTappedIndex = -1;
    self.shareSettings.currentBarPopupMenuIndex = -1;

    self.shareSettings.barPopupMenuAreaTapped=NO;
    self.shareSettings.barAreaTapped=NO;

    self.shareSettings.currentInstrument = [[NSMutableString alloc] initWithString:@""];
    self.shareSettings.currentInstrumentStatus = INST_DISC;
    
    self.shareSettings.modeStoryboard = self.modeStoryboard;
    
    [self.shareSettings initMeasureView];
    [self.shareSettings initMeasureBar];
    
    self.parManager = [ParameterManager parameterManager];
    [self.parManager registerParameterChangedEvent];

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
    
    //mbarCVC.barPopupMenuTVC = self.barPMenuTVC;

    // Border Radius
    //[self.menuView.layer setCornerRadius:LIGHT_CORNER_RADIUS];
    [self.menuView.layer setMasksToBounds:YES];
    //[self.menuView setClipsToBounds:YES];
    // Border
    [self.menuView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.menuView.layer setBorderWidth:NORMAL_BORDER_WIDTH];
    // Background
    //[self.menuView.layer setBackgroundColor:[UIColor darkGrayColor].CGColor];
    
    //self.barPopupMenuShowed = NO;
}

-(void) viewWillAppear:(BOOL)animated{
    //[self layoutVC:[self getMSALayout] animated:NO];
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"ContainerViewController - viewDidAppear");

    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuTapped) name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(measureTapped) name:@"measureTapped" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barTapped) name:@"barTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barPopupMenuAreaTapped) name:@"barPopupMenuAreaTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barAreaTapped) name:@"barAreaTapped" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    NSLog(@"ContainerViewController - viewDidDisappear");

    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"measureTapped" object:nil];
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"barTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"barPopupMenuAreaTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"barAreaTapped" object:nil];
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

        //((MainContainerView *)self.mainView).barV = self.displayCVC.barV;
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
    if([segue.identifier isEqualToString:@"embedSegueToBarPopupMenuTVC"])
    {
        self.barPMenuTVC = (BarPopupMenuTableViewController *)segue.destinationViewController;
        self.barPMenuTVC.shareSettings = self.shareSettings;
        self.barPMenuTVC.mainCVC = self;
        
        self.barPMenuTVC.frameWidth = MENU_WIDTH;
        self.barPMenuTVC.frameHeight = BAR_MENU_HEIGHT;
        
        self.barCVC.barPopupMenuTVC = self.barPMenuTVC;
        [self.barCVC setBarPopupMenuViewController:self.barPMenuTVC];
        
        ((MainContainerView *)self.mainView).barPopupMenuV = self.barPMenuTVC.view;
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
    
    //[self.menuView setHidden:NO];
    [self layoutVC:NO];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)menuTapped {
    self.shareSettings.menuDisplayed = !self.shareSettings.menuDisplayed;
    [self layoutVC:YES];
}

//-(void)barTapped {
//    [self layoutVC:YES];
//}

- (void)measureTapped {
    self.shareSettings.measureDisplayed = !self.shareSettings.measureDisplayed;
    [self layoutVC:YES];
}

- (void)barPopupMenuAreaTapped {
    [self layoutVC:YES];
}

- (void)barAreaTapped {
    [self layoutVC:YES];
}

- (void)layoutVC:(BOOL)animated
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
 
    UIImage *img = nil;
    UIImage *blurImg = nil;
    
    //if(self.barPopupMenuShowed == YES)
    //{
    //    self.barPopupMenuShowed = NO;
    //    self.shareSettings.barPopupMenuDisplayed = NO;
    //}
    
    if(self.shareSettings.barPopupMenuAreaTapped == NO)
    {
        if(self.shareSettings.barAreaTapped == YES)
        {
            
        }
        else
        {
            
        }
    }
    
    CGFloat displayWidth = 0.0f;
    if(self.shareSettings.menuDisplayed == YES)
        displayWidth = self.frameWidth - MENU_WIDTH;
    else
        displayWidth = self.frameWidth;
    CGFloat barMenuPosition = [self.shareSettings measureBarPopupMenuPosition:self.shareSettings.barTappedIndex forWidth:displayWidth];

    NSAssert(!(self.shareSettings.barPopupMenuDisplayed == YES && self.shareSettings.measureDisplayed == YES), @"ERROR : Bar PopupMenu and Measure Select are both YES!");
    
    if(self.shareSettings.barPopupMenuDisplayed == YES)
    {
        // Show Bar Popup Menu

        self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);
        
        //self.barPopupMenuShowed = YES;

        layoutBlock = ^(void)
        {
            self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, MENU_WIDTH, BAR_MENU_HEIGHT);
        };
        completionBlock = ^(BOOL finished){
        };
    }
    if(self.shareSettings.measureDisplayed == YES)
    {
        // Show Connect Instrument and Select Measure/View
        
        // It should be processed in lost focus event of barPopupMenuView
        //self.barPopupMenuView.frame = CGRectMake(-MENU_WIDTH-VC_MARGIN, 0, MENU_WIDTH, 0);
        
        if(self.shareSettings.menuDisplayed == YES)
        {
            self.menuCVC.presetViewVisible = NO;
            [self.menuCVC showHidePresetMenu:NO animated:NO];
        }
        self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);

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
            
            //[self.displayView setUserInteractionEnabled:YES];
            //[self.menuView setUserInteractionEnabled:YES];

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MEAS_WIDTH-VC_MARGIN, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
                self.menuView.frame = CGRectMake(self.frameWidth-MENU_WIDTH, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth-MENU_WIDTH, self.frameHeight);
                self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);
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

            //[self.displayView setUserInteractionEnabled:YES];

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MEAS_WIDTH-VC_MARGIN, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
                self.menuView.frame = CGRectMake(self.frameWidth+VC_MARGIN, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
                self.barPopupMenuView.frame = CGRectMake(barMenuPosition, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);
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
    
    if(self.shareSettings.measureDisplayed == YES)
    {
        self.blurView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
        [self.blurVC.blurImage setImage:blurImg];
    }
}

@end
