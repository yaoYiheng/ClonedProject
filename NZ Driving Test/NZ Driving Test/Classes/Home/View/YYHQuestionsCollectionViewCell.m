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

/** 错题数组*/
@property (nonatomic, strong) NSMutableArray *wrongAnswerArray;
@end

@implementation YYHQuestionsCollectionViewCell

#pragma mark - -------lazy loading--------------
- (NSMutableArray *)wrongAnswerArray{
    if (!_wrongAnswerArray) {
        _wrongAnswerArray = [NSMutableArray array];

    }
    return _wrongAnswerArray;
}
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
            NSLog(@"回答错误");
            self.resultLable.text = nil;
            self.resultLable.alpha = 1.0;

            //动画持续1s, 设置透明度为0, 并显示相应的字符串

            [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
                self.resultLable.numberOfLines = 0;
                self.resultLable.text = @"Wrong, try agin!";
                self.resultLable.alpha = 0;
            } completion:nil];

            //将错误的回答保存.
            if (![self.wrongAnswerArray containsObject:self.questionItem]) {
                [self.wrongAnswerArray addObject:self.questionItem];
            }
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

    //动画持续1s, 设置透明度为0, 并显示相应的字符串
//    [UIView animateWithDuration:1.0 animations:^{
//        self.timeLabel.alpha = 1.0;
//
//    } completion:^(BOOL finished)
//     {
//         //动画结束后, 需要执行以下代码, 持续0.5s, 延迟1s执行, 将显示栏的透明度变为0.
//         [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//             self.timeLabel.text = @"Change your answer or tap to confirm";
//             self.timeLabel.alpha = 0;
//         } completion:nil];
//     }];


}

//更改时间栏
- (void)changeTimeLabel: (NSNotification *)time{
    NSLog(@"%@", time.userInfo[YYHcountDown]);
    NSNumber *sec = time.userInfo[YYHcountDown];

    NSInteger second = [sec integerValue];

    if (second <= 10) {
        //        [self skipClick];

        self.timeLabel.textColor = [UIColor redColor];
    }
    self.timeLabel.text =  [NSString stringWithFormat:@"%02ld:%02ld", second / 60, second % 60];
}

/**
 添加计时器
 */
-(void)addTimer{
    //1. 创建timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];

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
/**
 倒数进入主页面, 同时修改倒计时显示.
 
 
 ***
 感觉最好是通过外界将倒计时传入到cell中比较好.
 */
- (void)countDown{
    static NSInteger second = 2100;

    //倒数到0时. 跳转到tabBarVC
    if (second <= 10) {
//        [self skipClick];

        self.resultLable.textColor = [UIColor redColor];
    }
    second--;
    NSLog(@"%ld", (long)second);
//    [self.resultLabel.text setTitle:[NSString stringWithFormat:@"跳过 (%d)", second] forState:UIControlStateNormal];
    self.resultLable.text =  [NSString stringWithFormat:@"%02ld:%02ld", second / 60, second % 60];
}

-  (void)setQuestionItem:(YYHQuestionItem *)questionItem{
    _questionItem = questionItem;
    self.selectedButton.selected = NO;
    self.resultLable.text = nil;
    self.questionLabel.text = @"";

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
@end
