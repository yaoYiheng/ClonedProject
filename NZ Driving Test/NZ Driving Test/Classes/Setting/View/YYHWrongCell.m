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
    // Initialization code
}
- (void)setItem:(YYHQuestionItem *)item{
    _item = item;
    self.questionLabel.text = self.item.Question;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
