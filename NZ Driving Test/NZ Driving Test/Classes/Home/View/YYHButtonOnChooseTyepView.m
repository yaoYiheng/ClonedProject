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

    [self setBackgroundImage:[UIImage imageNamed:@"button_normal_backbround"] forState:UIControlStateNormal];

    self.titleLabel.font = [UIFont systemFontOfSize:22];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                           
    [self setBackgroundColor:[UIColor whiteColor]];

    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    
}

@end
