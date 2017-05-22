//
//  YYHNavigationController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHNavigationController.h"

@interface YYHNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation YYHNavigationController

+ (void)load
{
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];

    // 只要是通过模型设置,都是通过富文本设置
    // 设置导航条标题 => UINavigationBar
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];

    // 设置导航条背景图片
    [navBar setBackgroundImage:[UIImage imageWithStretched:@"navigationbarBackgroundRed"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //creat pan Ges
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];

    //add
    [self.view addGestureRecognizer:panGes];


    panGes.delegate = self;



    self.interactivePopGestureRecognizer.enabled = NO;


}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {

        viewController.hidesBottomBarWhenPushed = YES;

        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backBarButtonWithImage:[UIImage imageNamed:@"navigationButtonReturn"]  hightligtedImage:[UIImage imageNamed:@"navigationButtonReturnClick"] Target:self action:@selector(back) title:@"返回"];


    }

    [super pushViewController:viewController animated:animated];
}
#pragma mark -----UIGestureRecognizerDelegate方法-----
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    //只有当子控制器为非根控制器时, 才允许接收手势.
    return self.childViewControllers.count > 1;
}
- (void)back{
    [self popViewControllerAnimated:YES];
}
@end
