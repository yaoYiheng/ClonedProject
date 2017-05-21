//
//  YYHChooseTypeView.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/21.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHChooseTypeView.h"

@implementation YYHChooseTypeView

+ (instancetype)creatViewFromNib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

@end
