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

    [self setBackgroundImage:[UIImage imageNamed:@"HomeButton_Clickd"] forState:UIControlStateNormal];

    self.titleLabel.font = [UIFont systemFontOfSize:22];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
}

@end
