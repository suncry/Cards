//
//  CYMyPropertyTableViewController.m
//  ButlerCard
//
//  Created by niko on 14-3-20.
//  Copyright (c) 2014年 johnny tang. All rights reserved.
//

#import "CYMyPropertyTableViewController.h"
#import "CYMyPropertyTableViewCell.h"
#import "SVPullToRefresh.h"

@interface CYMyPropertyTableViewController ()

@end

@implementation CYMyPropertyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //注册下拉刷新功能
    __weak CYMyPropertyTableViewController *weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf insertRowAtTop];
    }];
    //注册上拉刷新功能
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // Configure the cell...
    CYMyPropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CYMyPropertyCell" forIndexPath:indexPath];
    [cell.titleLable setText:[NSString stringWithFormat:@"小区通知%lu",(long)indexPath.row]];
    return cell;
}
#pragma mark --SVPullToRefresh--
//下拉刷新
- (void)insertRowAtTop
{
    //为了模拟加载数据的过程 设置方法延迟2秒执行
    // 延迟2秒执行：
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //停止刷新
        [self.tableView.pullToRefreshView stopAnimating];
    });
}
//上拉加载更多
- (void)insertRowAtBottom
{
    //为了模拟加载数据的过程 设置方法延迟2秒执行
    // 延迟2秒执行：
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //停止加载更多
        [self.tableView.infiniteScrollingView stopAnimating];
    });
}


@end
