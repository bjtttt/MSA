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
#import "Mode.h"
#import "MeasureBase.h"
#import "MainContainerViewController.h"
#import "DisplayContainerViewController.h"
#import "MenuContainerViewController.h"
#import "MeasureContainerViewController.h"
#import "MeasureBarContainerViewController.h"
#import "BarPopupMenuContainerViewController.h"
#import "UIView+Screenshot.h"
#import "MainContainerView.h"
#import "SoftMenuContainerViewController.h"
#import "PresetMenuContainerViewController.h"
#import "MeasureBarDetail.h"
#import "InputContainerViewController.h"

@interface MainContainerViewController ()

@end

@implementation MainContainerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //if(self.mainView.barCV == nil)
    //    self.mainView.barCV = self.displayCVC.barV;
    
    //_mainView.frame = CGRectMake(0, 0, _frameWidth, _frameHeight);
    
    //[self curDispTypeChanged];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //_mainView.frame = CGRectMake(0, 0, _frameWidth, _frameHeight);
    
    [self curDispTypeChanged];
}

-(void)loadView {
    [super loadView];
    
    _frameWidth = self.view.frame.size.width;
    _frameHeight = self.view.frame.size.height;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(curDispTypeChanged) name:@"curDispType" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(curDispTypeChanged) name:@"curBarIndex" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"curDispType" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"curBarIndex" object:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
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
    if([segue.identifier isEqualToString:@"embedSegueToInputVC"])
    {
        _inputCVC = (InputContainerViewController *)segue.destinationViewController;
        _inputCVC.shareSettings = _shareSettings;
        _inputCVC.mainCVC = self;
        
        _inputCVC.frameWidth = INPUT_WIDTH;
        _inputCVC.frameHeight = INPUT_HEIGHT;
    }
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)curDispTypeChanged
{
    void (^layoutBlock)(void);
    void (^completionBlock)(BOOL finished);
    
    bool animated = YES;

    switch(_shareSettings.curDispType)
    {
        default:
        case UIDT_NONE:
            [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Current display type cannot be UIDT_NONE"];
            break;
        case UIDT_NORMAL:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                {
                    animated = NO;
                    layoutBlock = ^(void)
                    {
                        [self setDisplayConnSel:NO];
                        [self setDisplayMenu:NO];
                        [self setDisplayInput:NO atPosition:CGPointMake(100.0f, 100.0f)];
                        [self setDisplayPresetMenu:NO];
                        [self setDisplayMeasBar:_frameWidth];
                        [self setDisplayMeasBarPopupMenu:NO forWidth:_frameWidth];
                    };
                    completionBlock = ^(BOOL finished){
                    };
                }
                    break;
                default:
                case UIDT_NORMAL:
                    return;
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_NORMAL_INPUT:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_NORMAL_INPUT"];
                    break;
                case UIDT_NORMAL:
                {
                    return;
                }
                    break;
                default:
                case UIDT_NORMAL_INPUT:
                    return;
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_NORMAL_BARPOPUP:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_NORMAL_BARPOPUP"];
                    break;
                case UIDT_NORMAL:
                {
                    return;
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                default:
                case UIDT_NORMAL_BARPOPUP:
                    return;
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_NORMAL_BARPOPUP_INPUT:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_NORMAL_BARPOPUP_INPUT"];
                    break;
                case UIDT_NORMAL:
                {
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                default:
                case UIDT_NORMAL_BARPOPUP_INPUT:
                    return;
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_MENU:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_MENU"];
                    break;
                case UIDT_NORMAL:
                {
                    return;
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                default:
                case UIDT_MENU:
                    return;
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_MENU_PRESET:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_MENU_PRESET"];
                    break;
                case UIDT_NORMAL:
                {
                    return;
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                default:
                case UIDT_MENU_PRESET:
                    return;
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_MENU_INPUT:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_MENU_INPUT"];
                    break;
                case UIDT_NORMAL:
                {
                    return;
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                default:
                case UIDT_MENU_INPUT:
                    return;
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_MENU_BARPOPUP:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_MENU_BARPOPUP"];
                    break;
                case UIDT_NORMAL:
                {
                    return;
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                default:
                case UIDT_MENU_BARPOPUP:
                    return;
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_MENU_BARPOPUP_INPUT:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_MENU_BARPOPUP_INPUT"];
                    break;
                case UIDT_NORMAL:
                {
                    return;
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                default:
                case UIDT_MENU_BARPOPUP_INPUT:
                    return;
                    break;
                case UIDT_CONNSEL:
                {
                    
                }
                    break;
            }
        }
            break;
        case UIDT_CONNSEL:
        {
            switch(_shareSettings.prevDispType)
            {
                case UIDT_NONE:
                    [NSException raise:@"MainContainerViewController::curDispTypeChanged" format:@"Previous display type cannot be UIDT_NONE when current display type is UIDT_CONNSEL"];
                    break;
                case UIDT_NORMAL:
                {
                }
                    break;
                case UIDT_NORMAL_INPUT:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_NORMAL_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU:
                {
                    
                }
                    break;
                case UIDT_MENU_PRESET:
                {
                    
                }
                    break;
                case UIDT_MENU_INPUT:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP:
                {
                    
                }
                    break;
                case UIDT_MENU_BARPOPUP_INPUT:
                {
                    
                }
                    break;
                default:
                case UIDT_CONNSEL:
                    return;
                    break;
            }
        }
            break;
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
    
    [self outputViewInfo];
}

-(void)setDisplayMeasBarPopupMenu:(bool)show forWidth:(float)width
{
    float barPopMenuPos = [_shareSettings.modeManager.curMeasure
                           measureBarPopupMenuPosition:_shareSettings.curBarIndex forWidth:width];
    if(show == YES)
        _barPopupMenuView.frame = CGRectMake(barPopMenuPos, NAVBAR_HEIGHT+BAR_HEIGHT, [_shareSettings.modeManager.curMBarDetail.popupMenuWidths[_shareSettings.curBarIndex] floatValue], [_shareSettings.modeManager.curMBarDetail.popupMenuHeights[_shareSettings.curBarIndex] floatValue]);
    else
        _barPopupMenuView.frame = CGRectMake(barPopMenuPos, NAVBAR_HEIGHT+BAR_HEIGHT, 0, 0);
}

-(void)setDisplayMeasBar:(float)width
{
    [_barCVC setBarsStartAndWidth:width];
}

-(void)setDisplayMenu:(bool)show
{
    if(show ==YES)
        _menuView.frame = CGRectMake(_frameWidth-MENU_WIDTH, 0, MENU_WIDTH, _frameHeight);
    else
        _menuView.frame = CGRectMake(_frameWidth, 0, MENU_WIDTH, _frameHeight);
}

-(void)setDisplayPresetMenu:(bool)show
{
    [_menuCVC showHidePresetMenu:show];
}

-(void)setDisplayConnSel:(bool)show
{
    if(show == YES)
        _measureView.frame = CGRectMake((_frameWidth-MEAS_WIDTH)/2, (_frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
    else
        _measureView.frame = CGRectMake(-MEAS_WIDTH-VC_MARGIN, (_frameHeight-MEAS_HEIGHT)/2, MEAS_WIDTH, MEAS_HEIGHT);
}

-(void)setDisplayInput:(bool)show atPosition:(CGPoint)point// withSize:(CGSize *)size
{
    if(show == YES)
        _inputView.frame = CGRectMake(point.x, point.y, INPUT_WIDTH, INPUT_HEIGHT);
    else
        _inputView.frame = CGRectMake(point.x, point.y, 0, 0);
}

-(void)outputViewInfo
{
    NSLog(@"\nDEBUG ----------------------------------------------");
    NSLog(@"Main View : x = %f, y = %f, width = %f, height = %f", _mainView.frame.origin.x, _mainView.frame.origin.y, _mainView.frame.size.width, _mainView.frame.size.height);
}

@end
