//
//  YYHAnswerButton.m
//  Json转plist
//
//  Created by 姚懿恒 on 2017/5/12.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHAnswerButton.h"

@interface YYHAnswerButton ()

/** <#comments#>*/
@property (nonatomic, weak) YYHAnswerButton *selectedButton;
@end

@implementation YYHAnswerButton


- (void)awakeFromNib{
    [super awakeFromNib];



    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.contentMode = UIViewContentModeScaleAspectFill;
    self.titleLabel.numberOfLines = 0;
    //可以通过修改内容内边距来调整文字的显示区域
    self.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    self.layer.masksToBounds = YES;

    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];


    [self setBackgroundImage:[UIImage imageNamed:@"optionals_click"] forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage imageWithStretched:@"button_normal_backbround"] forState:UIControlStateNormal];

    if (iphone5 || iphone4) {
        self.layer.cornerRadius = 5;
    }
    self.layer.cornerRadius = 10;

    self.titleLabel.contentMode = UIViewContentModeScaleAspectFill;
    self.titleLabel.numberOfLines = 0;
    self.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    if (iphone4) {
        self.titleLabel.font = [UIFont systemFontOfSize:10];

    }
    else if (iphone5) {
        self.titleLabel.font = [UIFont systemFontOfSize:12];

    }
    else if (iphone6){
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    else if (iphone6P || iphone7P){
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    else if (iPad){
        self.titleLabel.font = [UIFont systemFontOfSize:22];
    }
    else if (iPad12){
        self.titleLabel.font = [UIFont systemFontOfSize:25];
    }
}


- (void)setHighlighted:(BOOL)highlighted{

}

@end
