//
//  YYHQuestionsCollectionViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/23.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHQuestionsCollectionViewController.h"
#import "YYHQuestionsCollectionViewCell.h"
#import "YYHQuestionItem.h"
@interface YYHQuestionsCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

/** <#comments#>*/
@property (nonatomic, weak) NSTimer *timer;
/** <#comments#>*/
@property (nonatomic, assign) NSInteger second;

/** 错题数组*/
@property (nonatomic, strong) NSMutableArray *wrongAnswerArray;
@end

@implementation YYHQuestionsCollectionViewController

static NSString * const reuseIdentifier = @"cell";
#pragma mark - -------lazy loading--------------
- (NSMutableArray *)wrongAnswerArray{
    if (!_wrongAnswerArray) {
        _wrongAnswerArray = [NSMutableArray array];
    }
    return _wrongAnswerArray;
}
#pragma mark - -------view life cycle--------------

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureView];


    //当点击了关闭按钮
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeQuestionView) name:YYHTCloseButtonDidClicked object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addQuestionItemsIntoArray:) name:YYHPassingWrongNotification object:nil];
    //添加计时器功能已完成.
    [self addTimer];



}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YYHTCloseButtonDidClicked object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YYHPassingWrongNotification object:nil];

    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - -------configure--------------
/**
 添加计时器
 */
-(void)addTimer{
    //1. 创建timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];


    self.second = 0;
}

/**
 倒数进入主页面, 同时修改倒计时显示.


 ***
 感觉最好是通过外界将倒计时传入到cell中比较好.
 */
- (void)countDown{




    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[YYHcountDown] = [NSNumber numberWithInteger:_second];

    [[NSNotificationCenter defaultCenter] postNotificationName:YYHCountDownNotification object:nil userInfo:dict];

    
    _second++;
}
- (void)configureView{

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = self.view.bounds.size;
    //    flowLayout.itemSize = CGSizeMake(50, 50);
    flowLayout.minimumLineSpacing = 0;

    UICollectionView *colltectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    colltectionView.dataSource = self;
    colltectionView.delegate = self;
    colltectionView.pagingEnabled = YES;
    colltectionView.showsHorizontalScrollIndicator = NO;
    colltectionView.clearsContextBeforeDrawing = YES;



    [colltectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YYHQuestionsCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    //    [colltectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];

    [self.view addSubview:colltectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.questionArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YYHQuestionsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell

    YYHQuestionItem *questionItem = self.questionArray[indexPath.row];
    questionItem.current = indexPath;
    questionItem.total = self.questionArray.count;
    cell.questionItem = questionItem;

    return cell;
}

#pragma mark - -------method for notifications--------------
- (void)closeQuestionView{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"确定退出吗?" message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];

        [self.timer invalidate];
        self.timer = nil;
    }];

    [alertVC addAction:cancle];
    [alertVC addAction:confirm];

    [self presentViewController:alertVC animated:YES completion:nil];


}
- (void)addQuestionItemsIntoArray: (NSNotification *)info{

    YYHQuestionItem *item = info.object;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *savedEncodedData = [defaults objectForKey:YYHWrongQuestionsArray];
    
    self.wrongAnswerArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:savedEncodedData];

    [self.wrongAnswerArray addObject:item];
    //save data
    NSData *encodedWrongList = [NSKeyedArchiver archivedDataWithRootObject:self.wrongAnswerArray];

    [defaults setObject:encodedWrongList forKey:YYHWrongQuestionsArray];









}
@end
