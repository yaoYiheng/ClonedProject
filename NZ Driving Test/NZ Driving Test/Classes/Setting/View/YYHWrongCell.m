//
//  YYHWrongCell.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/31.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHWrongCell.h"
#import "YYHQuestionItem.h"
@interface YYHWrongCell ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@end

@implementation YYHWrongCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.layer.cornerRadius = YYHMargin;
//    self.layer.masksToBounds = YES;

    self.yyh_x += YYHMargin;
    self.yyh_width -= 2 * YYHMargin;
    self.yyh_height -= YYHMargin;

    if (iphone4) {
        self.questionLabel.font = [UIFont systemFontOfSize:13];

    }
    else if (iphone5) {
        self.questionLabel.font = [UIFont systemFontOfSize:14];

    }
    else if (iphone6){
        self.questionLabel.font = [UIFont systemFontOfSize:15];
    }
    else if (iphone6P || iphone7P){
        self.questionLabel.font = [UIFont systemFontOfSize:16];
    }
}
- (void)setItem:(YYHQuestionItem *)item{
    _item = item;
    self.questionLabel.text = self.item.Question;
}

@end
