

#import "UIImage+WithoutRendering.h"

@implementation UIImage (WithoutRendering)

#pragma mark 返回不经过渲染的图片
+ (UIImage *)imageWithoutRendering:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageWithStretched:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width / 2 topCapHeight:image.size.height / 2];

}
@end
