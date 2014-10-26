//
//  DisplayBarContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ShareSettings.h"
#import "ContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "DisplayBarContainerViewController.h"
#import "Bar0TableViewController.h"
#import "Bar1TableViewController.h"
#import "Bar2TableViewController.h"
#import "Bar3TableViewController.h"
#import "Bar4TableViewController.h"
#import "Bar5TableViewController.h"
#import "Bar6TableViewController.h"
//#import "Bar7TableViewController.h"
#import "MeasureBarDefinition.h"

@interface DisplayBarContainerViewController ()

@end

@implementation DisplayBarContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.barVs = [[NSMutableArray alloc] initWithObjects:self.bar0V, self.bar1V, self.bar2V, self.bar3V, self.bar4V, self.bar5V, self.bar6V, nil];//, self.bar7V, nil];
    self.barVCs = [[NSMutableArray alloc] initWithObjects:self.bar0VC, self.bar1VC, self.bar2VC, self.bar3VC, self.bar4VC, self.bar5VC, self.bar6VC, nil];//, self.bar7VC, nil];
    
    for(UIView *bv in self.barVs)
    {
        // Border Radius
        [bv.layer setCornerRadius:LIGHT_CORNER_RADIUS];
        [bv.layer setMasksToBounds:YES];
        //[self.measureView setClipsToBounds:YES];
        // Border
        [bv.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [bv.layer setBorderWidth:NORMAL_BORDER_WIDTH];
        // Background
        //[self.bar0V.layer setBackgroundColor:[UIColor darkGrayColor].CGColor];
    }
    
    //[self adjustMeasureBarWidth:NO];
    
    self.previousFrameWidth = self.frameWidth;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedSegueToBar0VC"])
    {
        self.bar0VC = (Bar0TableViewController *)segue.destinationViewController;
        self.bar0VC.shareSettings = self.shareSettings;
        self.bar0VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar1VC"])
    {
        self.bar1VC = (Bar1TableViewController *)segue.destinationViewController;
        self.bar1VC.shareSettings = self.shareSettings;
        self.bar1VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar2VC"])
    {
        self.bar2VC = (Bar2TableViewController *)segue.destinationViewController;
        self.bar2VC.shareSettings = self.shareSettings;
        self.bar2VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar3VC"])
    {
        self.bar3VC = (Bar3TableViewController *)segue.destinationViewController;
        self.bar3VC.shareSettings = self.shareSettings;
        self.bar3VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar4VC"])
    {
        self.bar4VC = (Bar4TableViewController *)segue.destinationViewController;
        self.bar4VC.shareSettings = self.shareSettings;
        self.bar4VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar5VC"])
    {
        self.bar5VC = (Bar5TableViewController *)segue.destinationViewController;
        self.bar5VC.shareSettings = self.shareSettings;
        self.bar5VC.displayBarCVC = self;
    }
    if([segue.identifier isEqualToString:@"embedSegueToBar6VC"])
    {
        self.bar6VC = (Bar6TableViewController *)segue.destinationViewController;
        self.bar6VC.shareSettings = self.shareSettings;
        self.bar6VC.displayBarCVC = self;
    }
    /*
    if([segue.identifier isEqualToString:@"embedSegueToBar7VC"])
    {
        self.bar7VC = (Bar7TableViewController *)segue.destinationViewController;
        self.bar7VC.shareSettings = self.shareSettings;
        self.bar7VC.displayBarCVC = self;
    }
    */
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //[self setMeasureBarAccordingToFrame];
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

- (BOOL) prefersStatusBarHidden {
    return YES;
}

-(void) setBarsStartAndWidthAccordingTo:(CGFloat)width
{
    CGFloat prevWidth = 0.0;
    CGFloat barWidth = 0.0;

    for(int i=0;i<self.shareSettings.measureBarCount; i++)
    {
        UIView *view = (UIView *)[self.barVs objectAtIndex:i];
        UIViewController<MeasureBarDefinition> *vc = (UIViewController<MeasureBarDefinition> *)[self.barVCs objectAtIndex:i];
        
        CGFloat fv = [(NSNumber *)[self.shareSettings.barWidths objectAtIndex:i] floatValue];
        if(self.shareSettings.useBarRatio == YES)
            barWidth = width * fv / self.shareSettings.totalBarWidth;
        else
            barWidth = fv;
        
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

@end
