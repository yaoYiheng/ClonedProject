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
    self.layer.cornerRadius = YYHMargin;
    self.layer.masksToBounds = YES;
    if (iphone4) {
        self.questionLabel.font = [UIFont systemFontOfSize:12];

    }
    else if (iphone5) {
        self.questionLabel.font = [UIFont systemFontOfSize:13];

    }
}
- (void)setItem:(YYHQuestionItem *)item{
    _item = item;
    self.questionLabel.text = self.item.Question;
}
- (void)setFrame:(CGRect)frame{
    
    frame.origin.x += YYHMargin;
    frame.size.width -= 2 * YYHMargin;
    frame.size.height -= YYHMargin;
    [super setFrame:frame];
}

@end
