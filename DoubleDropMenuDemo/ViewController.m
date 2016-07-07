//
//  ViewController.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ViewController.h"
#import "ZLCategoryViewController.h"
#import "ZLPeopleViewController.h"
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
        [button setTitle:@"DropDowdDemo1" forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor blackColor];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.mas_equalTo(100);
        }];
        button;
    });
    
    UIButton * btnTwo = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 10;
        button.backgroundColor = [UIColor purpleColor];
        [button setTitle:@"DropDowdDemo2" forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor blackColor];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(btnOne.mas_bottom).offset(50);
        }];
        button;
    });
    
}

- (void)buttonClicked:(UIButton *)button{
    if (button.tag == 9) {
        ZLPeopleViewController * peopleVC = [[ZLPeopleViewController alloc] init];
        [self.navigationController pushViewController:peopleVC animated:YES];
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
