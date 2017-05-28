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
}
- (void)viewWillAppear:(BOOL)animated{
}

#pragma mark - -------configure--------------
/**
 添加计时器
 */
-(void)addTimer{
    //1. 创建timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];

#warning 在这里更改倒计时秒数为2100
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
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.timer invalidate];
    self.timer = nil;

    _second = 12;
}
- (void)addQuestionItemsIntoArray: (NSNotification *)info{

    YYHQuestionItem *item = info.object;
        if (![self.wrongAnswerArray containsObject:item]) {
            [self.wrongAnswerArray addObject:item];
            NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;

            NSString *filePath = [cachePath stringByAppendingPathComponent:YYHCacheFileName];

    YYHLog(@"%@--%@", item, self.wrongAnswerArray);


//            NSArray *array = @[@"123", @"1234"];
            if ([NSKeyedArchiver archiveRootObject:self.wrongAnswerArray toFile:filePath]) {
                YYHLog(@"成功");
            }
            else{
                YYHLog(@"失败");
            }
        }



}
@end
