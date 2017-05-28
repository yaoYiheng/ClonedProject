//
//  YYHQuestionsCollectionViewCell.m
//  Json转plist
//
//  Created by 姚懿恒 on 2017/5/11.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHQuestionsCollectionViewCell.h"
#import "YYHAnswerButton.h"
#import "YYHQuestionItem.h"
@interface YYHQuestionsCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIView *questionView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *resultLable;

@property (weak, nonatomic) IBOutlet YYHAnswerButton *answerA;
@property (weak, nonatomic) IBOutlet YYHAnswerButton *answerB;

@property (weak, nonatomic) IBOutlet YYHAnswerButton *answerC;
@property (weak, nonatomic) IBOutlet YYHAnswerButton *answerD;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeButton;

@property (weak, nonatomic) IBOutlet UIStackView *StackView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *gapBetween;

/** <#comments#>*/
@property (nonatomic, weak) NSTimer *timer;
/** <#comments#>*/
@property (nonatomic, weak) YYHAnswerButton *selectedButton;


@end

@implementation YYHQuestionsCollectionViewCell

#pragma mark - -------lazy loading--------------

#pragma mark - -------buttonClick--------------
- (IBAction)colseButtonClick {
    [[NSNotificationCenter defaultCenter] postNotificationName:YYHTCloseButtonDidClicked object:nil];
}

- (IBAction)answerButtonClick:(YYHAnswerButton *)sender {



    self.selectedButton.selected = NO;

    sender.selected = YES;



    NSInteger correctIndex = _questionItem.CorrectAnswer.integerValue;
    NSLog(@"%ld", (long)correctIndex);

    



    //按钮第二次点击时
    if (self.selectedButton == sender) {
        if (sender.tag == self.questionItem.CorrectAnswer.integerValue) {
            NSLog(@"%@", sender.currentTitle);
            self.resultLable.text = nil;



            [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionAutoreverse animations:^{
                self.resultLable.alpha = 1.0;

                self.resultLable.numberOfLines = 0;
                self.resultLable.text = @"Great! You are right!~";
                self.resultLable.alpha = 0;
            } completion:nil];

        }
        else{
            
            self.resultLable.text = nil;
            self.resultLable.alpha = 1.0;

            //动画持续1s, 设置透明度为0, 并显示相应的字符串

            [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
                self.resultLable.numberOfLines = 0;
                self.resultLable.text = @"Wrong, try agin!";
                self.resultLable.alpha = 0;
            } completion:nil];

            //不需要再这里进行判断, 在这里负责将每一个对象传递出去, 外界负责判断
            [[NSNotificationCenter defaultCenter] postNotificationName:YYHPassingWrongNotification object:self.questionItem];

            }
    }



    self.selectedButton = sender;




}

- (void)awakeFromNib {
    [super awakeFromNib];
    if (iphone5) {
        self.resultLabel.font = [UIFont systemFontOfSize:13];
        self.questionLabel.font = [UIFont systemFontOfSize:14];
        self.resultLable.font = [UIFont systemFontOfSize:13];


    }



    

    self.questionView.layer.masksToBounds = YES;
    self.questionView.layer.cornerRadius = YYHCornerRadius;
    self.questionLabel.yyh_centerY = self.questionView.center.y;

    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = YYHCornerRadius;
    //紫色
//    self.questionLabel.textColor = YYHColor(240, 89, 249);
//    绿色
//    self.questionLabel.textColor = YYHColor(38, 199, 111);
    self.questionLabel.textColor = YYHColor(44, 202, 235);
//    self.questionLabel.textColor = YYHRandomColor;

//    [self addTimer];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTimeLabel:) name:YYHCountDownNotification object:nil];



}

//更改时间栏
- (void)changeTimeLabel: (NSNotification *)time{

    NSNumber *sec = time.userInfo[YYHcountDown];

    NSInteger second = [sec integerValue];


    self.timeLabel.text =  [NSString stringWithFormat:@"%02ld:%02ld", second / 60, second % 60];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    //超出父控件也显示
    self.resultLable.clipsToBounds = NO;
    if (iphone5) {
        self.gapBetween.constant = 20;
        [self layoutIfNeeded];
    }
}


-  (void)setQuestionItem:(YYHQuestionItem *)questionItem{
    _questionItem = questionItem;

    [self initSubViewsContent];


    self.questionLabel.text = questionItem.Question;
    [self.questionLabel sizeToFit];

    self.indexLabel.text = [NSString stringWithFormat:@"%ld / %ld", questionItem.current.row + 1, (long)questionItem.total];


    if (questionItem.Image.length > 1) {
        NSString *path = [[NSBundle mainBundle] pathForResource:questionItem.Image ofType:@"png"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];

        self.imageView.image = image;
    }else{
        self.imageView.image = nil;
    }





    if (questionItem.C.length < 1 ) {
        self.answerC.hidden = YES;
        self.answerD.hidden = YES;
    }
    else{
        self.answerC.hidden = NO;
        self.answerD.hidden = NO;

    }
    [self.answerA setTitle:questionItem.A forState:UIControlStateNormal];
    [self.answerB setTitle:questionItem.B forState:UIControlStateNormal];
    [self.answerC setTitle:questionItem.C forState:UIControlStateNormal];
    [self.answerD setTitle:questionItem.D forState:UIControlStateNormal];
}

- (void)initSubViewsContent{
    self.selectedButton.selected = NO;

    self.selectedButton = nil;
    self.resultLable.text = nil;
    self.questionLabel.text = @"";
}
@end
