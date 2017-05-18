//
//  YYHTabBarViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHTabBarViewController.h"

#import "YYHHomeViewController.h"
#import "YYHSettingController.h"
#import "YYHStatictisController.h"

#import "YYHNavigationController.h"

@interface YYHTabBarViewController ()

@end

@implementation YYHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = YYHRandomColor;

    [self configureChildrenViewControllers];
    
}

/**
 创建导航控制器, 并为其添加子控制器
 */
- (void)configureChildrenViewControllers{


    //Home
    YYHHomeViewController *homeVC = [YYHHomeViewController new];

    [self configureChildViewController:homeVC
                                 image:@"tabBar_essence_icon"
                         selectedImage:@"tabBar_essence_click_icon"
                                 title:@"精华"];

    //Statistics
    YYHStatictisController *statisticsVC = [YYHStatictisController new];
    [self configureChildViewController:statisticsVC
                                 image:@"tabBar_new_icon"
                         selectedImage:@"tabBar_new_click_icon"
                                 title:@"新帖"];

    //Setting
    YYHSettingController *settingVC = [YYHSettingController new];
    [self configureChildViewController:settingVC
                                 image:@"tabBar_new_icon"
                         selectedImage:@"tabBar_new_click_icon"
                                 title:@"Setting"];

}

- (void)configureChildViewController:(UIViewController *)controller image:(NSString *)image selectedImage: (NSString *)selectedImage title: (NSString *)title{
    YYHNavigationController *NavVC = [[YYHNavigationController alloc] initWithRootViewController:controller];
    NavVC.tabBarItem.title = title;
    NavVC.tabBarItem.image = [UIImage imageWithoutRendering:image];
    NavVC.tabBarItem.selectedImage = [UIImage imageWithoutRendering:selectedImage];
    [self addChildViewController:NavVC];
    
    
}
@end
