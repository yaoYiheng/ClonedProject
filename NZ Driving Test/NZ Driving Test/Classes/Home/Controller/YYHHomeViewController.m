//
//  YYHHomeViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHHomeViewController.h"
#import "MJExtension.h"
#import "YYHQuestionItem.h"

#import "YYHQuestionTableViewCell.h"
#import "YYHChooseTypeView.h"
#import "YYHButtonOnChooseTyepView.h"

#import "YYHCatagoriesViewController.h"

@interface YYHHomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *MiddlePlaceHolder;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distanceToTop;

/** array of all qustions*/
@property (nonatomic, strong) NSArray *allQuestionArray;
@end


@implementation YYHHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadQuestionsData];
    YYHChooseTypeView *view = [YYHChooseTypeView creatViewFromNib];

    [self.MiddlePlaceHolder addSubview:view];


    self.navigationItem.title = @"首页";

//    if (iphone5) {
//        self.distanceToTop.constant = 20;
//
//    }

//
//    if (iphone4||iphone5) {
//        self.distanceToTop.constant = 20;
//
//    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(typeButtonDidClicked:) name:YYHTypeButtonDidClicked object:nil];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

//    //for different devices
    if (iphone4) {
        self.distanceToTop.constant = -5;

    }
    else if (iphone5) {
        self.distanceToTop.constant = 20;

    }
    else if (iphone6P)
    {
        self.distanceToTop.constant = 100;
    }

    
    YYHChooseTypeView *chooseView = self.MiddlePlaceHolder.subviews.firstObject;
    chooseView.frame = CGRectMake(0, 0, self.MiddlePlaceHolder.yyh_width, self.MiddlePlaceHolder.yyh_height);

}
#pragma mark - -------load data--------------
- (void)loadQuestionsData{
    self.allQuestionArray = [YYHQuestionItem mj_objectArrayWithFilename: @"正确.plist"];
     

}
#pragma mark - -------addTargetForButton--------------
- (void)typeButtonDidClicked: (NSNotification *)notification{


    YYHButtonOnChooseTyepView *button = notification.object;
    NSLog(@"%ld", button.tag);

    YYHCatagoriesViewController *catagory = [[YYHCatagoriesViewController alloc
                                              ] init];

    NSString *title = [button currentTitle];
    catagory.titleForNav = title;
    [self.navigationController pushViewController:catagory animated:YES];
}
@end
