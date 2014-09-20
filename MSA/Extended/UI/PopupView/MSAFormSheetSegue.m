//
//  MSAFormSheetSegue.h
//  MSAFormSheetSegue
//

#import "MSAFormSheetSegue.h"
#import "MSAFormSheetController.h"

@implementation MSAFormSheetSegue

- (void)perform
{
    UIViewController *sourceViewController = [self sourceViewController];
    UIViewController *destinationViewController = [self destinationViewController];
    
    [sourceViewController presentFormSheetWithViewController:destinationViewController animated:YES completionHandler:nil];
}

@end
