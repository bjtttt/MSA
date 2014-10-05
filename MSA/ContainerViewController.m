//
//  ContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "ParameterManager.h"
#import "ContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "MenuContainerViewController.h"
#import "MeasureContainerViewController.h"
#import "DisplayBarContainerViewController.h"
#import "BlurViewController.h"
#import "BarMenuContainerViewController.h"
#import "UIView+Screenshot.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

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
    [self.barView.layer setCornerRadius:NORMAL_CORNER_RADIUS];
    [self.barView.layer setMasksToBounds:YES];
    //[self.measureView setClipsToBounds:YES];
    
    // Bar View Border
    [self.barView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.barView.layer setBorderWidth:NORMAL_BORDER_WIDTH];

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
    //self.shareSettings.prevprevMSALayout=MSA_DISP;

    self.shareSettings.currentInstrument = [[NSMutableString alloc] initWithString:@""];
    self.shareSettings.currentInstrumentStatus = INST_DISC;
    
    self.shareSettings.modeStoryboard = self.modeStoryboard;
    //self.shareSettings.measBarStoryboard = self.measBarStoryboard;
    
    [self.shareSettings initMeasureView];
    
    self.parManager = [ParameterManager parameterManager];
    [self.parManager registerParameterChangedEvent];

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(measureTapped) name:@"measureTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(barTapped) name:@"barTapped" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    NSLog(@"ContainerViewController - viewDidDisappear");

    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"measureTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"barTapped" object:nil];
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
    if([segue.identifier isEqualToString:@"embedSegueToBarMenuCVC"])
    {
        self.barMenuCVC = (BarMenuContainerViewController *)segue.destinationViewController;
        self.barMenuCVC.shareSettings = self.shareSettings;
        self.barMenuCVC.mainCVC = self;
        
        self.barMenuCVC.frameWidth = MENU_WIDTH;
        self.barMenuCVC.frameHeight = BAR_MENU_HEIGHT;
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

-(void)barTapped {
    self.shareSettings.barDisplayed = !self.shareSettings.barDisplayed;
    [self layoutVC:YES];
}

- (void)measureTapped {
    self.shareSettings.measureDisplayed = !self.shareSettings.measureDisplayed;
    [self layoutVC:YES];
}

- (void)layoutVC:(BOOL)animated
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);

    UIImage *img = nil;
    UIImage *blurImg = nil;
    
    NSAssert(!(self.shareSettings.barDisplayed == YES && self.shareSettings.measureDisplayed == YES), @"ERROR : Bar PopupMenu and Measure Select are both YES!");
    
    if(self.shareSettings.barDisplayed == YES)
    {
        CGFloat singleBarWidth = 0.0f;
        
        if(self.shareSettings.menuDisplayed == YES)
        {
            singleBarWidth = (self.frameWidth - MENU_WIDTH - MEASBAR_SINGLE_WIDTH) / 7.0;
            
            [self.displayView setUserInteractionEnabled:NO];
            [self.menuView setUserInteractionEnabled:NO];
        }
        else
        {
            singleBarWidth = (self.frameWidth - MEASBAR_SINGLE_WIDTH) / 7.0;
        
            [self.displayView setUserInteractionEnabled:NO];
            //[self.menuView setUserInteractionEnabled:NO];
        }
        self.barView.frame = CGRectMake(singleBarWidth*self.shareSettings.barTappedIndex, NAVBAR_HEIGHT+MEASBAR_HEIGHT, MENU_WIDTH, 0);

        //img = [self.view convertViewToImage];// [self.shareSettings screenShot:self saveInAlbum:NO];
        //blurImg = [self.shareSettings blurryImage:img];

        layoutBlock = ^(void)
        {
            self.barView.frame = CGRectMake(singleBarWidth*self.shareSettings.barTappedIndex, NAVBAR_HEIGHT+MEASBAR_HEIGHT, MENU_WIDTH, BAR_MENU_HEIGHT);
        };
        completionBlock = ^(BOOL finished){
        };
    }
    if(self.shareSettings.measureDisplayed == YES)
    {
        self.barView.frame = CGRectMake(-MENU_WIDTH-VC_MARGIN, 0, MENU_WIDTH, 0);
        
        img = [self.view convertViewToImage];// [self.shareSettings screenShot:self saveInAlbum:NO];
        blurImg = [self.shareSettings blurryImage:img];
        
        if(self.shareSettings.menuDisplayed == YES)
        {
            self.displayCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            self.displayCVC.frameHeight = self.frameHeight;
            self.displayCVC.barCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            
            // In fact, it is not necessary.
            // It is to keep the same as Bar Popup Menu
            [self.displayView setUserInteractionEnabled:NO];
            [self.menuView setUserInteractionEnabled:NO];
            
            self.menuCVC.presetViewVisible = NO;
            [self.menuCVC showHidePresetMenu:NO animated:YES];
            
            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake((self.frameWidth-MEAS_WIDTH)/2, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
            };
            completionBlock = ^(BOOL finished){
            };
        }
        else
        {
            self.displayCVC.frameWidth = self.frameWidth;
            self.displayCVC.frameHeight = self.frameHeight;
            self.displayCVC.barCVC.frameWidth = self.frameWidth;
            
            // In fact, it is not necessary.
            // It is to keep the same as Bar Popup Menu
            [self.displayView setUserInteractionEnabled:NO];
            //[self.menuView setUserInteractionEnabled:NO];

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake((self.frameWidth-MEAS_WIDTH)/2, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
            };
            completionBlock = ^(BOOL finished){
            };
        }
    }
    if(self.shareSettings.barDisplayed == NO && self.shareSettings.measureDisplayed == NO)
    {
        CGFloat singleBarWidth = 0.0f;
        
        if(self.shareSettings.menuDisplayed == YES)
            singleBarWidth = (self.frameWidth - MENU_WIDTH - MEASBAR_SINGLE_WIDTH) / 7.0;
        else
            singleBarWidth = (self.frameWidth - MEASBAR_SINGLE_WIDTH) / 7.0;
        self.blurView.frame = CGRectMake(-self.frameWidth-VC_MARGIN, 0, self.frameWidth, self.frameHeight);
        
        if(self.shareSettings.menuDisplayed == YES)
        {
            self.displayCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            self.displayCVC.frameHeight = self.frameHeight;
            self.displayCVC.barCVC.frameWidth = self.frameWidth - MENU_WIDTH;
            
            [self.displayView setUserInteractionEnabled:YES];
            [self.menuView setUserInteractionEnabled:YES];

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MEAS_WIDTH-VC_MARGIN, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
                self.menuView.frame = CGRectMake(self.frameWidth-MENU_WIDTH, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth-MENU_WIDTH, self.frameHeight);
                self.barView.frame = CGRectMake(singleBarWidth*self.shareSettings.barTappedIndex, NAVBAR_HEIGHT+MEASBAR_HEIGHT, MENU_WIDTH, 0);
            };
            completionBlock = ^(BOOL finished){
            };
        }
        else
        {
            self.displayCVC.frameWidth = self.frameWidth;
            self.displayCVC.frameHeight = self.frameHeight;
            self.displayCVC.barCVC.frameWidth = self.frameWidth;
            
            [self.displayView setUserInteractionEnabled:YES];

            layoutBlock = ^(void)
            {
                self.measureView.frame = CGRectMake(-MEAS_WIDTH-VC_MARGIN, (self.frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
                self.menuView.frame = CGRectMake(self.frameWidth+VC_MARGIN, 0, MENU_WIDTH, self.frameHeight);
                self.displayView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
                self.barView.frame = CGRectMake(singleBarWidth*self.shareSettings.barTappedIndex, NAVBAR_HEIGHT+MEASBAR_HEIGHT, MENU_WIDTH, 0);
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
    
    if(self.shareSettings.measureDisplayed == YES)// || self.shareSettings.barDisplayed == YES)
    {
        self.blurView.frame = CGRectMake(0, 0, self.frameWidth, self.frameHeight);
        [self.blurVC.blurImage setImage:blurImg];
    }
}

@end
