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
        self.categoryLabel.font = [UIFont systemFontOfSize:13];

    }
    else if (iphone5) {
        self.categoryLabel.font = [UIFont systemFontOfSize:14];
        
    }
    else if (iphone6){
        self.categoryLabel.font = [UIFont systemFontOfSize:15];
    }
    else if (iphone7P || iphone6P){
        self.categoryLabel.font = [UIFont systemFontOfSize:16];
    }
    else if(iPad){
        self.categoryLabel.font = [UIFont systemFontOfSize:22];
    }
    else if (iPad12){
        self.categoryLabel.font = [UIFont systemFontOfSize:25];
    }
}


- (void)setCategoryText:(NSString *)categoryText{
    _categoryText = categoryText;

    self.categoryLabel.text = categoryText;
}
- (void)setFrame:(CGRect)frame{



    if (iPad || iPad12) {
        frame.origin.x += YYHMargin * 12;
        frame.size.width -= 24 * YYHMargin;
        frame.size.height -= YYHMargin * 2;
    }

    else{
        frame.origin.x += YYHMargin * 5;
        frame.size.width -= 10 * YYHMargin;
        frame.size.height -= YYHMargin;
    }
    [super setFrame:frame];
}

@end
