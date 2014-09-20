//
//  UIImage+Additional.h
//  MZFormSheetControllerExample
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Additional)

- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

- (UIImage *)blurredImageWithRadius:(CGFloat)blurRadius
                          tintColor:(UIColor *)tintColor
              saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                          maskImage:(UIImage *)maskImage;
@end
