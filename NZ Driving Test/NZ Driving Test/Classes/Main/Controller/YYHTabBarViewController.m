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

#pragma mark - -------life cycle of the View--------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = YYHRandomColor;

    [self configureChildrenViewControllers];
    
}

+ (void)load{


    UITabBarItem *barItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];


    //setting the selected text color
    NSMutableDictionary *attriDict = [NSMutableDictionary dictionary];

    attriDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [barItem setTitleTextAttributes:attriDict forState:UIControlStateSelected];


    //it's only works on UIControlStateNormal
    NSMutableDictionary *dictFont = [NSMutableDictionary dictionary];
    dictFont[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [barItem setTitleTextAttributes:dictFont forState:UIControlStateNormal];


}
#pragma mark - -------configure --------------

/**
 creat NavigationControllers and add child VCs for it
 */
- (void)configureChildrenViewControllers{


    //Home
    UIStoryboard *story = [UIStoryboard storyboardWithName:NSStringFromClass([YYHHomeViewController class]) bundle:nil];

    YYHHomeViewController *homeVC = [story instantiateInitialViewController];

    [self configureChildViewController:homeVC
                                 image:@"tabBar_essence_icon"
                         selectedImage:@"tabBar_click_icon"
                                 title:@"首页"];

    //Statistics
    YYHStatictisController *statisticsVC = [YYHStatictisController new];
    [self configureChildViewController:statisticsVC
                                 image:@"statiscics_normal"
                         selectedImage:@"statistics_Clicked"
                                 title:@"统计"];

    //Setting
    YYHSettingController *settingVC = [YYHSettingController new];
    [self configureChildViewController:settingVC
                                 image:@"Seting_normal"
                         selectedImage:@"Seting_on_click"
                                 title:@"设置"];

}

- (void)configureChildViewController:(UIViewController *)controller image:(NSString *)image selectedImage: (NSString *)selectedImage title: (NSString *)title{
    YYHNavigationController *NavVC = [[YYHNavigationController alloc] initWithRootViewController:controller];
    NavVC.tabBarItem.title = title;
    NavVC.tabBarItem.image = [UIImage imageWithoutRendering:image];
    NavVC.tabBarItem.selectedImage = [UIImage imageWithoutRendering:selectedImage];
    [self addChildViewController:NavVC];
    
    
}
@end
