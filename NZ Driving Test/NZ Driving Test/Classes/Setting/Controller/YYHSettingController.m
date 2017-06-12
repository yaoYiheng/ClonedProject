//
//  YYHSettingController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHSettingController.h"
#import "YYHDiscalmerViewController.h"
#import <MessageUI/MessageUI.h>

@interface YYHSettingController ()<MFMailComposeViewControllerDelegate>

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
    imageView.image = [UIImage imageNamed:@"LaunchImage"];
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

    if (indexPath.row == 1) {
        //清除所有错题.
        [self clearAllWrong];
    }
    if(indexPath.row == 2){
        //发送反馈
        [self sendFeedback];
        
    }
}
#pragma mark - -------具体方法实现--------------
- (void)sendFeedback{
    //判断用户是否已设置邮件
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@" 您还未设置邮件" message:nil preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];

        [alertVC addAction:cancle];

        [self presentViewController:alertVC animated:YES completion:nil];
        //不加return, 再没有设置邮件的情况下,程序会崩溃
        return;

    }

    MFMailComposeViewController* composeVC = [[MFMailComposeViewController alloc] init];
    composeVC.mailComposeDelegate = self;

    // Configure the fields of the interface.
    [composeVC setToRecipients:@[@"yiheng1117@gmail.com"]];
    [composeVC setSubject:@"问题/建议反馈"];
    [composeVC setMessageBody:@"" isHTML:NO];

    // Present the view controller modally.
    [self presentViewController:composeVC animated:YES completion:nil];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    // Check the result or perform other tasks.

    // Dismiss the mail compose view controller.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clearAllWrong{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"确定清除所有错题吗?" message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

        //删除所有错题
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *savedEncodedData = [defaults objectForKey:YYHWrongQuestionsArray];
        if (savedEncodedData){
        NSMutableArray *array = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:savedEncodedData];
        //删除数组所有元素
        [array removeAllObjects];

        //覆盖
        NSData *encodedWrongList = [NSKeyedArchiver archivedDataWithRootObject:array];

        [defaults setObject:encodedWrongList forKey:YYHWrongQuestionsArray];
        }

    }];

    [alertVC addAction:cancle];
    [alertVC addAction:confirm];

    [self presentViewController:alertVC animated:YES completion:nil];
}
@end
