//
//  ZLBoyViewController.h
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CellDidClick)(NSIndexPath *selectIndex, NSString *categoryName, NSString * subCategoryName);

@interface ZLBoyViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) CellDidClick callbackBlock;

@property (nonatomic, strong) UITableView * commonTableView;

- (void)reloadTableViewData;

@end
