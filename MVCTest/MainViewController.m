//
//  MainViewController.m
//  MVCTest
//
//  Created by WangTu on 15/8/19.
//  Copyright (c) 2015年 WangTu. All rights reserved.
//

#import "MainViewController.h"
#import "ASIFormDataRequest.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation MainViewController {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDefaultValue];
    [self setupDefaultView];
    [self request];
}

- (void)setupDefaultValue {
    self.dataArray = [NSMutableArray array];
}

- (void)setupDefaultView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)request {
    NSString *urlString = @"http://beautifulword.sinaapp.com/results.php";
    NSURL *url = [NSURL URLWithString:urlString];
    
    ASIFormDataRequest *_request = [ASIFormDataRequest requestWithURL:url];
    __weak ASIFormDataRequest *request = _request;
    
    [request setCompletionBlock:^{
        NSData *data = request.responseData;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *array = [dict objectForKey:@"Profile"];
        for (NSDictionary *itemDict in array) {
            [self.dataArray  addObject:itemDict];
        }
        [_tableView reloadData];
    }];
    [request setFailedBlock:^{
        NSLog(@"failed");
    }];
    
    [request startAsynchronous];
}

#pragma mark- UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    NSDictionary *dict = self.dataArray[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    cell.detailTextLabel.text = dict[@"age"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
