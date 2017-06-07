//
//  YYHDiscalmerViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/6/4.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHDiscalmerViewController.h"
#import <WebKit/WebKit.h>

@interface YYHDiscalmerViewController ()
@property (weak, nonatomic) WKWebView *webView;

@end

@implementation YYHDiscalmerViewController

- (WKWebView *)webView{
    if (!_webView) {
        WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:webView];
        self.webView = webView;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"免责声明";
    [self loadDiscalmer];
}
-(void)loadDiscalmer
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"免责声明.htm" withExtension:nil];

      NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //加载网页
    [self.webView loadRequest:request];
}





@end
