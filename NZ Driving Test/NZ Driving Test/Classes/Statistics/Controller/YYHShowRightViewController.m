//
//  YYHShowRightViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/6/2.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHShowRightViewController.h"
#import "YYHQuestionItem.h"
@interface YYHShowRightViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
/** <#comments#>*/
@property (nonatomic, strong) NSMutableArray *optionals;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distanceToTop;
@property (weak, nonatomic) IBOutlet UIButton *currectButton;

@end

@implementation YYHShowRightViewController
- (NSMutableArray *)optionals{
    if (!_optionals) {
        _optionals = [NSMutableArray array];
    }
    return _optionals;
}
- (IBAction)confirmButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)setUpContents{
    if (self.questionItem.Image.length > 1) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.questionItem.Image ofType:@"png"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];

        self.imageView.image = image;
    }
    else{
        self.distanceToTop.constant = 0;

    }

    self.questionLabel.text = self.questionItem.Question;

    NSInteger index = self.questionItem.CorrectAnswer.integerValue - 1;
    self.rightLabel.text = [NSString stringWithFormat:@"%@", self.optionals[index]];

}
- (void)configureSubviews{
    //紫色
    //    self.questionLabel.textColor = YYHColor(240, 89, 249);
    //    绿色
    //    self.questionLabel.textColor = YYHColor(38, 199, 111);
    
    self.questionLabel.textColor = YYHColor(44, 202, 235);
    self.rightLabel.textColor = YYHColor(125, 229, 12);
    self.rightLabel.textColor = [UIColor greenColor];

    self.imageView.layer.cornerRadius = YYHMargin;
    self.imageView.layer.masksToBounds = YES;

    self.currectButton.layer.cornerRadius = YYHMargin;
    self.currectButton.layer.masksToBounds = YES;

    if (iphone4) {
        self.rightLabel.font = [UIFont systemFontOfSize:14];
        self.questionLabel.font = [UIFont systemFontOfSize:14];
        self.distanceToTop.constant = 40;

    }
    else if (iphone5) {
        self.questionLabel.font = [UIFont systemFontOfSize:15];
        self.rightLabel.font = [UIFont systemFontOfSize:15];

    }
    else if (iphone6){
        self.questionLabel.font = [UIFont systemFontOfSize:16];
        self.rightLabel.font = [UIFont systemFontOfSize:16];
    }
    else if (iphone6P || iphone7P){
        self.distanceToTop.constant = 200;
        self.questionLabel.font = [UIFont systemFontOfSize:17];
        self.rightLabel.font = [UIFont systemFontOfSize:17];
    }
    else if (iPad){
        self.distanceToTop.constant = 300;
        self.questionLabel.font = [UIFont systemFontOfSize:25];
        self.rightLabel.font = [UIFont systemFontOfSize:25];
    }
    else if (iPad12){
        self.distanceToTop.constant = 300;
        self.questionLabel.font = [UIFont systemFontOfSize:25];
        self.rightLabel.font = [UIFont systemFontOfSize:25];
    }


}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureSubviews];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self setUpContents];
}
- (void)setQuestionItem:(YYHQuestionItem *)questionItem{
    
    _questionItem = questionItem;

    NSString *A = questionItem.A;
    NSString *B = questionItem.B;
    NSString *C = questionItem.C;
    NSString *D = questionItem.D;


    [self.optionals addObject:A];
    [self.optionals addObject:B];

    if (C) {
        [self.optionals addObject:C];
        [self.optionals addObject:D];
    }


}
@end
