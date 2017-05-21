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

/** array of all qustions*/
@property (nonatomic, strong) NSArray *allQuestionArray;
@end


@implementation YYHHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadQuestionsData];

    [self.MiddlePlaceHolder addSubview:[YYHChooseTypeView creatViewFromNib]];
    
}


- (void)loadQuestionsData{
    self.allQuestionArray = [YYHQuestionItem mj_objectArrayWithFilename: @"正确.plist"];

}
@end
