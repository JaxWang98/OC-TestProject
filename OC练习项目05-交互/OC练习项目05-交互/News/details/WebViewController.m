//
//  WebViewController.m
//  OC练习项目05-交互
//
//  Created by EHI on 2020/6/10.
//  Copyright © 2020 EHI. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "person.h"

#define personcontext @"personcontext"
#define webviewcontext @"webviewcontext"

@interface WebViewController () <WKNavigationDelegate>

@property(nonatomic,strong) WKWebView *webView;
@property(nonatomic,strong) UIProgressView *progressView;

@property (nonatomic, strong) person *p;



@end

@implementation WebViewController

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p = [[person alloc] init];
    self.p.name = @"wzj";
    
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size
                                                                  .width, self.view.bounds.size.height - 88 )];
        self.webView.navigationDelegate = self;
        self.webView;
    })];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    
    [self.p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:personcontext];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:webviewcontext];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 20)];
        self.progressView;
    })];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.p.name = @"jjjjj";
    });
}



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


@end
