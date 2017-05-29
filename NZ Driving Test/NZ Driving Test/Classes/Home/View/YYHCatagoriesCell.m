//
//  YYHCatagoriesCell.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/24.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHCatagoriesCell.h"

@implementation YYHCatagoriesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame{
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}
@end
