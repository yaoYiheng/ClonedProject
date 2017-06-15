//
//  YYHNavigationController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHNavigationController.h"
#import "YYHDiscalmerViewController.h"

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

    //获取系统侧滑手势
    UIGestureRecognizer *systemPopGes = self.interactivePopGestureRecognizer;
    //禁用系统侧滑
    systemPopGes.enabled = NO;
    //得到系统target-action数组
    NSMutableArray *_targets = [systemPopGes valueForKey:@"_targets"];
    //取出系统实现侧滑的target
    id systemPanTarget = [_targets.firstObject valueForKey:@"target"];
    //获取系统实现侧滑的action
    NSString *selectorStringBegin = @"handleNavigation";
    NSString *selectorStringEnd = @"Transition:";
    NSString *selectorString = [NSString stringWithFormat:@"%@%@",selectorStringBegin,selectorStringEnd];
    SEL systemAction = NSSelectorFromString(selectorString);
    //自定义滑动手势
    UIPanGestureRecognizer *myPan = [[UIPanGestureRecognizer alloc] initWithTarget:systemPanTarget action:systemAction];
    myPan.delegate = self;
    myPan.maximumNumberOfTouches = 1;
    //向系统实现侧滑的view中加入自定义的滑动手势
    [systemPopGes.view addGestureRecognizer:myPan];


}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.childViewControllers.count > 0) {

        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backBarButtonWithImage:[UIImage imageNamed:@"closeBack"]  hightligtedImage:[UIImage imageNamed:@"closeBack"] Target:self action:@selector(back) title:@"返回"];
            viewController.hidesBottomBarWhenPushed = YES;



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
