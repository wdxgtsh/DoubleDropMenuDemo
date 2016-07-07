//
//  ZLGirlViewController.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ZLGirlViewController.h"

@implementation ZLGirlViewController

@dynamic commonTableView;

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)reloadTableViewData{
    [self.commonTableView reloadData];
}

@end
