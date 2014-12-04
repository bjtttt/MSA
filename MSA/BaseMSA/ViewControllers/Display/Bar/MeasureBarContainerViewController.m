//
//  MeasureBarContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ShareSettings.h"
#import "MainContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "MeasureBarContainerViewController.h"
#import "Bar0ViewController.h"
#import "Bar1ViewController.h"
#import "Bar2ViewController.h"
#import "Bar3ViewController.h"
#import "Bar4ViewController.h"
#import "Bar5ViewController.h"
#import "Bar6ViewController.h"
#import "Bar7ViewController.h"
#import "Bar8ViewController.h"
#import "Bar9ViewController.h"
#import "MeasureBarProtocol.h"
#import "MeasureBarContainerView.h"
#import "ModeManager.h"
#import "ModeBase.h"
#import "MeasureBase.h"
#import "MeasureBarDetail.h"

@interface MeasureBarContainerViewController ()

@end

@implementation MeasureBarContainerViewController

-(void)loadView
{
    [super loadView];
    
    self.barVs = [[NSMutableArray alloc] initWithObjects:self.bar0V, self.bar1V, self.bar2V, self.bar3V, self.bar4V, self.bar5V, self.bar6V, self.bar7V, self.bar8V, self.bar9V, nil];
    
    for(UIView *bv in self.barVs)
    {
        // Border Radius
        //[bv.layer setCornerRadius:LIGHT_CORNER_RADIUS];
        [bv.layer setMasksToBounds:YES];
        //[self.measureView setClipsToBounds:YES];
        // Border
        [bv.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [bv.layer setBorderWidth:NORMAL_BORDER_WIDTH];
        // Background
        //[self.bar0V.layer setBackgroundColor:[UIColor darkGrayColor].CGColor];
    }
    
    self.barCV.barVs = [[NSMutableArray alloc] initWithObjects:self.bar0V, self.bar1V, self.bar2V, self.bar3V, self.bar4V, self.bar5V, self.bar6V, self.bar7V, self.bar8V, self.bar9V, nil];
    
    //self.barCV.sendNotification = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.barVCs == nil)
    {
        self.barVCs = [[NSMutableArray alloc] initWithObjects:self.bar0VC, self.bar1VC, self.bar2VC, self.bar3VC, self.bar4VC, self.bar5VC, self.bar6VC, self.bar7VC, self.bar8VC, self.bar9VC, nil];//, self.bar7VC, nil];
    }
    if(self.barCV.shareSettings == nil)
        self.barCV.shareSettings = self.shareSettings;
    
    self.previousFrameWidth = self.frameWidth;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToBar0VC"])
    {
        self.bar0VC = (Bar0ViewController *)segue.destinationViewController;
        self.bar0VC.shareSettings = self.shareSettings;
        self.bar0VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar1VC"])
    {
        self.bar1VC = (Bar1ViewController *)segue.destinationViewController;
        self.bar1VC.shareSettings = self.shareSettings;
        self.bar1VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar2VC"])
    {
        self.bar2VC = (Bar2ViewController *)segue.destinationViewController;
        self.bar2VC.shareSettings = self.shareSettings;
        self.bar2VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar3VC"])
    {
        self.bar3VC = (Bar3ViewController *)segue.destinationViewController;
        self.bar3VC.shareSettings = self.shareSettings;
        self.bar3VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar4VC"])
    {
        self.bar4VC = (Bar4ViewController *)segue.destinationViewController;
        self.bar4VC.shareSettings = self.shareSettings;
        self.bar4VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar5VC"])
    {
        self.bar5VC = (Bar5ViewController *)segue.destinationViewController;
        self.bar5VC.shareSettings = self.shareSettings;
        self.bar5VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar6VC"])
    {
        self.bar6VC = (Bar6ViewController *)segue.destinationViewController;
        self.bar6VC.shareSettings = self.shareSettings;
        self.bar6VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar7VC"])
    {
        self.bar7VC = (Bar7ViewController *)segue.destinationViewController;
        self.bar7VC.shareSettings = self.shareSettings;
        self.bar7VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar8VC"])
    {
        self.bar8VC = (Bar8ViewController *)segue.destinationViewController;
        self.bar8VC.shareSettings = self.shareSettings;
        self.bar8VC.measureBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar9VC"])
    {
        self.bar9VC = (Bar9ViewController *)segue.destinationViewController;
        self.bar9VC.shareSettings = self.shareSettings;
        self.bar9VC.measureBarCVC = self;
    }
}

-(void)setBarPopupMenuViewController:(BarPopupMenuContainerViewController *)barPopupMenuCVC
{
    self.bar0VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar1VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar2VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar3VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar4VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar5VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar6VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar7VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar8VC.barPopupMenuCVC = self.barPopupMenuCVC;
    self.bar9VC.barPopupMenuCVC = self.barPopupMenuCVC;
}  

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //[self setMeasureBarAccordingToFrame];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    //[self setMeasureBarAccordingToFrame];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if(self.previousFrameWidth != self.frameWidth)
    {
        [self adjustMeasureBarWidth:YES];
    
        self.previousFrameWidth = self.frameWidth;
    }
    else
        [self setBarsStartAndWidthAccordingTo:self.frameWidth];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

// This method is not completed.
-(void) setBarsStartAndWidthAccordingTo:(CGFloat)width
{
    CGFloat prevWidth = 0.0;
    CGFloat barWidth = 0.0;

    int count = _shareSettings.modeManager.curMBarDetail.mbarCount;
    for(int i=0;i<count; i++)
    {
        UIView *view = (UIView *)_barVs[i];
        //UIViewController<MeasureBarProtocol> *vc = (UIViewController<MeasureBarProtocol> *)_barVCs[i];
        BarViewControllerBase *vc = (BarViewControllerBase *)_barVCs[i];
        
        if(_shareSettings.menuDisplayed == YES)
        {
            CGFloat fv = [(NSNumber *)_shareSettings.modeManager.curMBarDetail.mbarSmallWidths[i] floatValue];
            if(_shareSettings.modeManager.curMBarDetail.useRatio == YES)
                barWidth = width * fv / _shareSettings.modeManager.curMBarDetail.totalSmallWidth;
            else
                barWidth = fv;
        }
        else
        {
            CGFloat fv = [(NSNumber *)_shareSettings.modeManager.curMBarDetail.mbarWidths[i] floatValue];
            if(_shareSettings.modeManager.curMBarDetail.useRatio == YES)
                barWidth = width * fv / _shareSettings.modeManager.curMBarDetail.totalWidth;
            else
                barWidth = fv;
        }
        
        view.frame = CGRectMake(prevWidth, 0, barWidth, BAR_HEIGHT);
        vc.frameWidth = barWidth;
        vc.frameHeight = BAR_HEIGHT;
        
        prevWidth = prevWidth + barWidth;
    }
}

-(void)adjustMeasureBarWidth:(BOOL)animated {
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    [self setBarsStartAndWidthAccordingTo:self.previousFrameWidth];

    layoutBlock = ^(void)
    {
        [self setBarsStartAndWidthAccordingTo:self.frameWidth];
    };
    completionBlock = ^(BOOL finished){
    };
    
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

@end
