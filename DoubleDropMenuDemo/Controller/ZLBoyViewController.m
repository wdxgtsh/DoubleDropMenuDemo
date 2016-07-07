//
//  ZLBoyViewController.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ZLBoyViewController.h"
#import "ZLGirlViewController.h"
#import "Masonry.h"
#import "ZLDataTool.h"
#import "ZLCategoryModel.h"
#include <objc/runtime.h>
#include <objc/message.h>

@interface ZLBoyViewController()



@end

@implementation ZLBoyViewController

static NSInteger boySelectedIndex;


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _commonTableView = ({
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        tableView;
    });
}

- (void)reloadTableViewData{
    [_commonTableView reloadData];
}

#pragma mark |--- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self isMemberOfClass:[ZLBoyViewController class]]) {
        return [ZLDataTool categories].count;
    }else{
        ZLCategoryModel * model = [ZLDataTool categories][boySelectedIndex];
        return model.subcategories.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if ([self isMemberOfClass:[ZLBoyViewController class]]) {
        ZLCategoryModel * model = [ZLDataTool  categories][indexPath.row];
        cell.textLabel.text = model.name;
        if (model.subcategories.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }else{
        ZLCategoryModel * model = [ZLDataTool categories][boySelectedIndex];
        cell.textLabel.text = model.subcategories[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000001;
}

#pragma mark |--- UITableViewDatasource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self isMemberOfClass:[ZLBoyViewController class]]) {
        
        if (self.callbackBlock) {
            ZLCategoryModel * model = [ZLDataTool  categories][indexPath.row];
            boySelectedIndex = indexPath.row;
            self.callbackBlock(indexPath, model.name, @"");
        }
        
    }else{
        if (self.callbackBlock) {
            ZLCategoryModel * model = [ZLDataTool categories][boySelectedIndex];
            if (self.callbackBlock) {
                self.callbackBlock(indexPath, model.name ,model.subcategories[indexPath.row]);
            }
        }
    }
}

@end
