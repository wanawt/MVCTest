//
//  ViewController.m
//  MVCTest
//
//  Created by WangTu on 15/8/19.
//  Copyright (c) 2015年 WangTu. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation ViewController {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDefaultValue];
    [self setupDefaultView];
}

- (void)setupDefaultValue {
    self.dataArray = [NSMutableArray array];
}

- (void)setupDefaultView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
