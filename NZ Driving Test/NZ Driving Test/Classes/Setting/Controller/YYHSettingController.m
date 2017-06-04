//
//  YYHSettingController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHSettingController.h"
#import "YYHDiscalmerViewController.h"
#import <SafariServices/SafariServices.h>
@interface YYHSettingController ()

@end

@implementation YYHSettingController

static NSString * const reuseIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"设置";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"Info"] hightligtedImage:[UIImage imageNamed:@"Info"] Target:self action:@selector(showDisclamer)];
}

- (void)showDisclamer{

    YYHDiscalmerViewController *discalmerVC = [YYHDiscalmerViewController new];
    [self.navigationController pushViewController:discalmerVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }




    return cell;
}


#pragma mark - -------delegate--------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {


    }
}
@end
