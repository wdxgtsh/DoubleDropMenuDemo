//
//  ViewController.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ViewController.h"
#import "ZLCategoryViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btnOne = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 9;
        button.backgroundColor = [UIColor purpleColor];
        [button setTitle:@"原始" forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor blackColor];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view.mas_centerX);
            make.top.mas_equalTo(100);
            make.width.mas_equalTo(100);
        }];
        button;
    });
    
    UIButton * btnTwo = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 10;
        button.backgroundColor = [UIColor purpleColor];
        [button setTitle:@"fix 版" forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor blackColor];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(btnOne.mas_bottom).offset(50);
            make.width.mas_equalTo(100);
        }];
        button;
    });
    
}

- (void)buttonClicked:(UIButton *)button{
    if (button.tag == 9) {
        NSLog(@"待续~~~~~~~~~~~");
    }else if(button.tag == 10){
        ZLCategoryViewController * categoryViewController  = [[ZLCategoryViewController alloc] init];
        [self.navigationController pushViewController:categoryViewController animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
