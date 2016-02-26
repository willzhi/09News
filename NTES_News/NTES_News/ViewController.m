//
//  ViewController.m
//  NTES_News
//
//  Created by Detailscool on 16/2/26.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "ViewController.h"
#import "MyTopicViwController.h"
#import "MyLabel.h"
#define cnt 5

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupContentVC];
    
    [self setupTitle];
    
    [self showVC:0];
    
}

- (void)setupTitle {
    
    CGFloat labelW = 100;
    CGFloat labelH = self.titleScrollView.bounds.size.height;
    
    self.titleScrollView.contentSize = CGSizeMake(labelW*cnt, 0);
    
    for (NSInteger i = 0; i < cnt; i++) {
        
        CGFloat labelX = labelW * i;
        
        MyLabel * label = [[MyLabel alloc]init];
        label.text = [self.childViewControllers[i] title];
        label.frame = CGRectMake(labelX, 0, labelW, labelH);
        
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)]];
        
        [self.titleScrollView addSubview:label];
        
    }
    
}

- (void)titleClick:(UITapGestureRecognizer *)tap {
    
    NSUInteger index = [self.titleScrollView.subviews indexOfObject:tap.view];
    
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = self.view.bounds.size.width * index;
    
    [self.contentScrollView setContentOffset:offset animated:YES];
    
    [self showVC:index];
}

- (void)showVC:(NSInteger)index {
    
    UIViewController * showingVC = [self.childViewControllers objectAtIndex:index];
    
    if ([showingVC isViewLoaded]) return;
    
    showingVC.view.frame = CGRectMake(index*self.view.bounds.size.width, 0, self.contentScrollView.bounds.size.width, self.contentScrollView.bounds.size.height);
    
    [self.contentScrollView addSubview:showingVC.view];
    
}

- (void)setupContentVC{
    
    self.contentScrollView.contentSize = CGSizeMake(self.view.bounds.size.width*cnt, 0);
    self.contentScrollView.pagingEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentScrollView.delegate = self;
    
    MyTopicViwController * contentVC0 = [[MyTopicViwController alloc]init];
    contentVC0.ulr = @"http://c.m.163.com/nc/article/list/T1348648756099/0-20.html";
    contentVC0.title = @"财经";
    [self addChildViewController:contentVC0];
    
    MyTopicViwController * contentVC1 = [[MyTopicViwController alloc]init];
    contentVC1.ulr = @"http://c.m.163.com/nc/article/list/T1348650593803/0-20.html";
    contentVC1.title = @"时尚";
    [self addChildViewController:contentVC1];
    
    MyTopicViwController * contentVC2 = [[MyTopicViwController alloc]init];
    contentVC2.ulr = @"http://c.3g.163.com/nc/article/headline/T1348647853363/0-140.html";
    contentVC2.title = @"头条";
    [self addChildViewController:contentVC2];
    
    MyTopicViwController * contentVC3 = [[MyTopicViwController alloc]init];
    contentVC3.ulr = @"http://c.3g.163.com/nc/article/list/T1348648517839/0-20.html";
    contentVC3.title = @"娱乐";
    [self addChildViewController:contentVC3];
    
    MyTopicViwController * contentVC4 = [[MyTopicViwController alloc]init];
    contentVC4.ulr = @"http://c.3g.163.com/nc/article/list/T1414389941036/0-20.html";
    contentVC4.title = @"健康";
    [self addChildViewController:contentVC4];
    

    
}

#pragma mark - *****************UIScrollView代理方法*****************

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    CGPoint offset = self.titleScrollView.contentOffset;
    
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    
    MyLabel * label = self.titleScrollView.subviews[index];
    
    offset.x = label.center.x - self.view.bounds.size.width*0.5;
    
    if(offset.x < 0) offset.x = 0;
    
    if (offset.x > self.titleScrollView.contentSize.width - self.titleScrollView.bounds.size.width) {
        offset.x = self.titleScrollView.contentSize.width - self.titleScrollView.bounds.size.width;
    }
    
    for (MyLabel * otherLabel in self.titleScrollView.subviews) {
        if (otherLabel != label)
            otherLabel.scale = 1;
    }
    
    [self.titleScrollView setContentOffset:offset animated:YES];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    
    [self showVC:index];
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    CGFloat scale = scrollView.contentOffset.x * 1.0/ self.view.bounds.size.width - index;
    
    MyLabel * leftLabel = self.titleScrollView.subviews[index];
    MyLabel * rightLabel = index < self.titleScrollView.subviews.count-1? self.titleScrollView.subviews[index+1]:nil;
    
    leftLabel.scale = scale;
    rightLabel.scale = 1-scale;
    
}
@end
