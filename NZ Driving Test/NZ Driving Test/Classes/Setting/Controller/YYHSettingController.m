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
- (IBAction)segmentClicked:(UISegmentedControl *)sender {

    [[NSNotificationCenter defaultCenter] postNotificationName:YYHChangeVersionNotification object:sender];
}

static NSString * const reuseIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"更多";


    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"background"];
    self.tableView.backgroundView = imageView;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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


#pragma mark - -------delegate--------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
