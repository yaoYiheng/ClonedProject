//
//  YYHButtonOnChooseTyepView.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHButtonOnChooseTyepView.h"

@implementation YYHButtonOnChooseTyepView

//- (void)awakeFromNib{
//    [super awakeFromNib];
//
//    [self setBackgroundImage:[UIImage imageNamed:@"button_normal_backbround"] forState:UIControlStateNormal];
//
//    self.titleLabel.font = [UIFont systemFontOfSize:22];
//    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//                           
//    [self setBackgroundColor:[UIColor whiteColor]];
//
//    self.layer.cornerRadius = 10;
//    self.clipsToBounds = YES;
//    
//}

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

    if (iphone5) {
        self.layer.cornerRadius = 5;
    }
    self.layer.cornerRadius = 10;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (iphone5) {
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.contentMode = UIViewContentModeScaleAspectFill;
        self.titleLabel.numberOfLines = 0;
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    
    
}
@end
