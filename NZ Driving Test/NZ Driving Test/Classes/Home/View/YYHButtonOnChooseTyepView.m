//
//  YYHButtonOnChooseTyepView.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHButtonOnChooseTyepView.h"

@implementation YYHButtonOnChooseTyepView



- (void)awakeFromNib{
    [super awakeFromNib];

    if (iphone4) {
        self.titleLabel.font = [UIFont systemFontOfSize:13];

    }
    else if (iphone5) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];

    }
    else if (iphone6){
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    else if (iphone6P || iphone7P){
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    else if (iPad){
        self.titleLabel.font = [UIFont systemFontOfSize:23];
    }
    else if (iPad12){
        self.titleLabel.font = [UIFont systemFontOfSize:25];
    }

//    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.contentMode = UIViewContentModeScaleAspectFill;
    self.titleLabel.numberOfLines = 0;
    //可以通过修改内容内边距来调整文字的显示区域
    self.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    self.layer.masksToBounds = YES;

    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];


    [self setBackgroundImage:[UIImage imageNamed:@"optionals_click"] forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage imageWithStretched:@"button_normal_backbround"] forState:UIControlStateNormal];


    self.layer.cornerRadius = 10;
}

@end
