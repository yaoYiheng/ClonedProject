

#import "UIBarButtonItem+YYHBarButton.h"

@implementation UIBarButtonItem (YYHBarButton)
+ (instancetype)barButtonWithImage:(UIImage *)image hightligtedImage:(UIImage *)highlightedImage Target:(id)target action:(SEL)action{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIView *view = [[UIView alloc] initWithFrame:button.frame];
    [view addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:view];

}

+ (instancetype)barButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage Target:(id)target action:(SEL)action{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIView *view = [[UIView alloc] initWithFrame:button.frame];
    [view addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
    
}


+(instancetype)backBarButtonWithImage:(UIImage *)image hightligtedImage:(UIImage *) highlightedImage Target:(id)target action:(SEL)action title:(NSString *)title{

    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setImage:image forState:UIControlStateNormal];
    [barButton setImage:highlightedImage forState:UIControlStateHighlighted];
    [barButton setTitle:title forState:UIControlStateNormal];
    [barButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [barButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//    barButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 20);
    [barButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [barButton sizeToFit];

    return [[UIBarButtonItem alloc] initWithCustomView:barButton];
}
@end
