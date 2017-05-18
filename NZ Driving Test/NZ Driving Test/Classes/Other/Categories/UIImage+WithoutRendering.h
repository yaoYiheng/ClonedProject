

#import <UIKit/UIKit.h>

@interface UIImage (WithoutRendering)

+ (UIImage *)imageWithoutRendering:(NSString *)imageName;

+ (UIImage *)imageWithStretched:(NSString *)imageName;
@end
