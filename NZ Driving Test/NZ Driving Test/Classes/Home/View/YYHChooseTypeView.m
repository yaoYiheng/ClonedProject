//
//  YYHChooseTypeView.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/21.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHChooseTypeView.h"
#import "YYHButtonOnChooseTyepView.h"
@interface YYHChooseTypeView ()

@end

@implementation YYHChooseTypeView


- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    NSArray *titlesArray = @[@"轿车", @"摩托车", @"重型卡车3-5", @"重型卡车"];

    for (NSInteger index = 0; index < titlesArray.count; index++) {
        YYHButtonOnChooseTyepView *button = self.viewForLastBaselineLayout.subviews[index];
        [button setTitle:titlesArray[index] forState:UIControlStateNormal];

        button.tag = index + 1;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
+ (instancetype)creatViewFromNib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (void)buttonClick: (YYHButtonOnChooseTyepView *)button{

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[YYHTypeButtonDidClicked] = button;
    [[NSNotificationCenter defaultCenter] postNotificationName:YYHTypeButtonDidClicked  object:button userInfo:dict];;
}
@end
