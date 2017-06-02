//
//  YYHStatictisController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//
#import "MJExtension.h"
#import "YYHStatictisController.h"
#import "YYHQuestionItem.h"
#import "YYHQuestionsCollectionViewController.h"
#import "YYHWrongCell.h"

@interface YYHStatictisController ()

/** question Array*/
@property (nonatomic, strong) NSMutableArray *questionArray;

@end

@implementation YYHStatictisController

static NSString * const cellID = @"cell";
#pragma mark - -------lazy loading--------------
- (NSMutableArray *)questionArray{
    if (!_questionArray) {

        _questionArray = [NSMutableArray array];
    }

    return _questionArray;
}
#pragma mark - -------configure--------------
- (void)configureBase{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;


    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"background"];
    self.tableView.backgroundView = imageView;



    self.navigationItem.title = @"错题统计";

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYHWrongCell class]) bundle:nil] forCellReuseIdentifier:cellID];
}
#pragma mark - -------view life cycle--------------

- (void)viewDidLoad {
    [super viewDidLoad];


    [self configureBase];


}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *savedEncodedData = [defaults objectForKey:YYHWrongQuestionsArray];
    self.questionArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:savedEncodedData];


    if (self.questionArray.count == 0) {
        NSLog(@"没有任何错题, 真棒!");
    }

    [self.tableView reloadData];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YYHQuestionsCollectionViewController *questionVC = [[YYHQuestionsCollectionViewController alloc] init];
    
    questionVC.questionArray = self.questionArray;

    [self presentViewController:questionVC animated:YES completion:nil];
    

}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {

        //通过修改模型数据达到修改界面的目的. 删除所选择的那一行.
        [self.questionArray removeObjectAtIndex:indexPath.row];

        //save data
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *encodedWrongList = [NSKeyedArchiver archivedDataWithRootObject:self.questionArray];

        [defaults setObject:encodedWrongList forKey:YYHWrongQuestionsArray];

        /**在数组中删除模型后, 需对tableView进行刷新,
         这里使用deleteRowsAtIndexPaths:进行局部刷新, 并实现动画.
         */
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        tableView.editing = NO;
    }];
    return @[action];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.questionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YYHWrongCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];


    YYHQuestionItem *item = self.questionArray[indexPath.row];



    cell.item = item;
    return cell;
}

@end
