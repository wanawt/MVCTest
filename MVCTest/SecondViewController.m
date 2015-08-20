//
//  SecondViewController.m
//  MVCTest
//
//  Created by WangTu on 15/8/19.
//  Copyright (c) 2015年 WangTu. All rights reserved.
//

#import "SecondViewController.h"
#import "ASIFormDataRequest.h"
#import "UserModel.h"
#import "UserCell.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface SecondViewController ()
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation SecondViewController {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDefaultValue];
    [self setupDefaultView];
    [self request];
}

- (void)setupDefaultValue {
    _dataArray = [NSMutableArray array];
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
        self.dataArray = [dict objectForKey:@"Profile"];
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
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    for (NSDictionary *itemDict in dataArray) {
        UserModel *model = [[UserModel alloc] init];
        for (NSString *key in itemDict) {
            [model setValue:itemDict[key] forKey:key];
        }
        [_dataArray  addObject:model];
    }
}

@end
