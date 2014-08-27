//
//  ContainerViewController.m
//  MSA
//
//  Created by GUO Zhitao on 14-8-26.
//  Copyright (c) 2014年 KeySight. All rights reserved.
//

#import "ShareSettings.h"
#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.shareSettings = [ShareSettings sharedSettings];
    self.shareSettings.menuTapped=NO;
    self.shareSettings.connectTapped=NO;
    
    [self layoutVC:[self getVCLayoutType] animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuTapped) name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectTapped) name:@"connectTapped" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

-(void)menuTapped{
    [self layoutVC:[self getVCLayoutType] animated:YES];
    
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

-(void)connectTapped{
    [self layoutVC:[self getVCLayoutType] animated:YES];
    
    self.shareSettings.connectTapped=!self.shareSettings.connectTapped;
    
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

- (void)layoutVC:(VCLayoutType)layoutType animated:(BOOL)animated
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    switch (layoutType) {
        default:
        case VC_MENU:
            layoutBlock = ^(void){
                //float width = self.view.frame.size.width;
                //float height = self.view.frame.size.height;
                // The following codes for are DEBUG
                float width = self.displayVC.frame.size.width;
                float height = self.displayVC.frame.size.height;
                width = self.view.frame.size.width;
                height = self.view.frame.size.height;
                self.displayVC.frame = CGRectMake(0, 0, width, height);
            };
            completionBlock = ^(BOOL finished){
            };
            break;
        //case VC_DISPLAY:
        //    break;
        //case VC_CONNECT:
        //    break;
    }
    
    // The following codes for are DEBUG
    float width = self.displayVC.frame.size.width;
    float height = self.displayVC.frame.size.height;

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

    // The following codes for are DEBUG
    width = self.displayVC.frame.size.width;
    height = self.displayVC.frame.size.height;

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

-(VCLayoutType)getVCLayoutType {
    if(self.shareSettings.connectTapped==YES)
        return VC_CONNECT;
    if(self.shareSettings.menuTapped==YES)
        return VC_DISPLAY;
    return VC_MENU;
}

@end
