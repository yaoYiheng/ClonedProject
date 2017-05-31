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

    [self addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];


    [self setBackgroundImage:[UIImage imageNamed:@"optionals_click"] forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage imageWithStretched:@"button_normal_backbround"] forState:UIControlStateNormal];

    if (iphone5 || iphone4) {
        self.layer.cornerRadius = 5;
    }
    self.layer.cornerRadius = 10;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (iphone4) {
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.contentMode = UIViewContentModeScaleAspectFill;
        self.titleLabel.numberOfLines = 0;
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    if (iphone5) {
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.contentMode = UIViewContentModeScaleAspectFill;
        self.titleLabel.numberOfLines = 0;
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    }


}
- (void)titleButtonClick:(YYHAnswerButton *)button{

//
//    NSLog(@"第一次点击");
//    /*
//     UIControlStateNormal       = 0,
//     UIControlStateHighlighted  = 1 << 0,
//     UIControlStateDisabled     = 1 << 1,
//     UIControlStateSelected     = 1 << 2,
//     */
//
//    if (self.selectedButton == button) {
//        YYHFunc
//        NSLog(@"第二次点击");
//    }
//
//    self.selectedButton = button;


}
- (void)setHighlighted:(BOOL)highlighted{

}

@end
