//
//  YYHDiscalmerViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/6/4.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHDiscalmerViewController.h"
#import <SafariServices/SafariServices.h>

@interface YYHDiscalmerViewController ()
@property (weak, nonatomic) UIWebView *webView;

@end

@implementation YYHDiscalmerViewController

- (UIWebView *)webView{
    if (!_webView) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:webView];
        self.webView = webView;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadDiscalmer];
}
-(void)loadDiscalmer
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"免责声明.htm" withExtension:nil];

    //加载网页
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];


    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
}





@end
