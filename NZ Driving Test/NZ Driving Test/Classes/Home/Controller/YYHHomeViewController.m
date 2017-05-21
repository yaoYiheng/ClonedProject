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


    NSLog(@"%f", self.view.yyh_height);
    

//    if (iphone5) {
//        self.distanceToTop.constant = 20;
//
//    }

//
//    if (iphone4||iphone5) {
//        self.distanceToTop.constant = 20;
//
//    }

    NSLog(@"占位符view--%@", self.MiddlePlaceHolder);
    NSLog(@"view--%@", view);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

    //for different devices
    if (iphone4) {
        self.distanceToTop.constant = -5;

    }

    if (iphone5) {
        self.distanceToTop.constant = 20;

    }

    
    YYHChooseTypeView *chooseView = self.MiddlePlaceHolder.subviews.firstObject;
    chooseView.frame = CGRectMake(0, 0, self.MiddlePlaceHolder.yyh_width, self.MiddlePlaceHolder.yyh_height);
}
- (void)loadQuestionsData{
    self.allQuestionArray = [YYHQuestionItem mj_objectArrayWithFilename: @"正确.plist"];

}
@end
