//
//  ZJNewsDetailViewController.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJNewsDetailViewController.h"
#import <WebKit/WebKit.h>

@interface ZJNewsDetailViewController () <WKNavigationDelegate>

@property(nonatomic,strong) WKWebView *webView; //网页
@property(nonatomic,strong) UIProgressView *progressView; //进度条
@property (nonatomic, copy) NSString *articleUrl;
@end

@implementation ZJNewsDetailViewController


- (instancetype)initWithURL:(NSString *)urlString
{
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];

}

- (void)setUpUI {

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    [self addObserver];
}
- (void)addObserver {
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark -- WebViewDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"要不要加载？");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"加载完了");
    [self.progressView removeFromSuperview];

}
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    NSLog(@"KVO变化，回调,当前加载进度%@",change[@"new"]);
    self.progressView.progress = self.webView.estimatedProgress;
}

#pragma mark -- LazyLoad

- (WKWebView *)webView{
    if (!_webView) {
        WKWebView *wView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size
        .width, self.view.bounds.size.height - 88 )];
//        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];

        wView.navigationDelegate = self;
        _webView = wView;
    }
    return _webView;
}
- (UIProgressView *)progressView{
    if (!_progressView) {
        UIProgressView *view = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 68, self.view.bounds.size.width, 20)];
        _progressView = view;
    }
    return  _progressView;
}

@end
