//
//  ZLPeopleViewController.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ZLPeopleViewController.h"
#import "Masonry.h"
#import "ZLBoyViewController.h"
#import "ZLGirlViewController.h"
#import "MBProgressHUD.h"

@implementation ZLPeopleViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    [self initSubView];
}

#pragma mark |----- initSubView
- (void)initSubView{
    ZLBoyViewController * boyVC = [[ZLBoyViewController alloc] init];
    [self addChildViewController:boyVC];
    [self.view addSubview:boyVC.view];
    [boyVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.bottom.equalTo(self.view);
    }];
    
    
    ZLGirlViewController * girlVC = [[ZLGirlViewController alloc] init];
    [self addChildViewController:girlVC];
    [self.view addSubview:girlVC.view];
    [girlVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.top.bottom.equalTo(self.view);
        make.width.equalTo(boyVC.view.mas_width);
        make.leading.equalTo(boyVC.view.mas_trailing);
    }];
    
    boyVC.callbackBlock = ^(NSIndexPath * selectIndex, NSString * categoryName, NSString * subCategoryName){
        [self showMessage:[NSString stringWithFormat:@"--%@--", categoryName] duration:0.5];
        [girlVC.commonTableView reloadData];
    };
    
    girlVC.callbackBlock = ^(NSIndexPath * selectIndex, NSString * categoryName, NSString * subCategoryName){
        [self showMessage:[NSString stringWithFormat:@"%@---%@", categoryName, subCategoryName] duration:0.5];
    };

}

#pragma mark |--- showMessage
- (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration {
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = message;
    [hud hide:YES afterDelay:duration];
}


@end
