//
//  MyTopicViwController.m
//  NTES_News
//
//  Created by Detailscool on 16/2/26.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyTopicViwController.h"
#import "MyLiveCell.h"
#import "MyImageNewsCell.h"
#import "MyNewsCell.h"
#import "MyNews.h"

#import "NSObject+Extension.h"

#import <AFNetworking.h>

@interface MyTopicViwController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray * myNews;

@end

@implementation MyTopicViwController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupTableView];
    
    [self loadData];
    
  
}

static NSString * news_cellID = @"news_cell";
static NSString * live_cellID = @"live_cell";
static NSString * imageNews_cellID = @"imageNews_cell";

- (void)setupTableView {
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyNewsCell class]) bundle:nil] forCellReuseIdentifier:news_cellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyLiveCell class]) bundle:nil] forCellReuseIdentifier:live_cellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyImageNewsCell class]) bundle:nil] forCellReuseIdentifier:imageNews_cellID];
}

- (void)loadData {

    [[AFHTTPSessionManager manager]GET:self.ulr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {

        NSEnumerator* keyEnumerator = responseObject.keyEnumerator;
        
        NSArray * arr = responseObject[keyEnumerator.nextObject];
        
        [arr enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if (idx != 0) {
                
                [self.myNews addObject:[MyNews objectWithDictionary:dict]];
                
            }
            
        }];
        
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}


#pragma mark - *****************数据源方法*****************

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myNews.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyNews * news = self.myNews[indexPath.row];
    
    if (news.imgextra) {
        
        MyImageNewsCell * cell = [tableView dequeueReusableCellWithIdentifier:imageNews_cellID];
        
        cell.newsModel = news;
        
        return cell;
        
    }else if(news.live_info){
        
        MyLiveCell * cell = [tableView dequeueReusableCellWithIdentifier:live_cellID];
        
        cell.newsModel = news;
        
        return cell;
        
    } else {
        
        MyNewsCell * cell = [tableView dequeueReusableCellWithIdentifier:news_cellID];
        
        cell.newsModel = news;
        
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyNews * news = self.myNews[indexPath.row];
    
    return news.imgextra?150:news.live_info?200:80;
}

#pragma mark - *****************懒加载*****************

- (NSMutableArray *)myNews {
    if (!_myNews) {
        _myNews = [NSMutableArray array];
    }
    return _myNews;
}

@end
