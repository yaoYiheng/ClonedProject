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

@interface YYHStatictisController ()

/** question Array*/
@property (nonatomic, strong) NSMutableArray *questionArray;
@end

@implementation YYHStatictisController
#pragma mark - -------lazy loading--------------
- (NSMutableArray *)questionArray{
    if (!_questionArray) {

        _questionArray = [NSMutableArray array];
    }

    return _questionArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationItem.title = @"错题统计";

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *savedEncodedData = [defaults objectForKey:YYHWrongQuestionsArray];
    self.questionArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:savedEncodedData];
    [self.tableView reloadData];



}

- (void)setquestionItem:(YYHQuestionItem *)item{

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YYHQuestionsCollectionViewController *questionVC = [[YYHQuestionsCollectionViewController alloc] init];
    
    questionVC.questionArray = self.questionArray;

    [self presentViewController:questionVC animated:YES completion:nil];
    

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

//    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    NSString *fileFullPath = [path stringByAppendingPathComponent:YYHCacheFileName];
//
//
//    NSLog(@"%@", fileFullPath);
//    //    NSLog(@"%ld-----%@", self.questionArray.count, self.questionArray);
//
//    self.questionArray = [NSKeyedUnarchiver unarchiveObjectWithFile:fileFullPath];


    YYHQuestionItem *item = self.questionArray[indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"%@", item.Question];
    return cell;
}

@end
