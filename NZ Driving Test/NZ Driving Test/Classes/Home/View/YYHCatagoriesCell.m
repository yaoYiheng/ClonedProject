//
//  YYHCatagoriesCell.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/24.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHCatagoriesCell.h"

@interface YYHCatagoriesCell ()
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end
@implementation YYHCatagoriesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (iphone4) {
        self.categoryLabel.font = [UIFont systemFontOfSize:12];

    }
    else if (iphone5) {
        self.categoryLabel.font = [UIFont systemFontOfSize:13];
        
    }
    else if (iphone6){
        self.categoryLabel.font = [UIFont systemFontOfSize:14];
    }
    else if (iphone7P || iphone6P){
        self.categoryLabel.font = [UIFont systemFontOfSize:15];
    }
}


- (void)setCategoryText:(NSString *)categoryText{
    _categoryText = categoryText;

    self.categoryLabel.text = categoryText;
}
- (void)setFrame:(CGRect)frame{

    frame.origin.x += YYHMargin * 5;
    frame.size.width -= 10 * YYHMargin;
    frame.size.height -= YYHMargin;
    [super setFrame:frame];
}

@end
