
//
//  ZLCategoryViewController.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ZLCategoryViewController.h"
#import "ZLDropDownMenu.h"
#import "ZLCategoryModel.h"
#import "ZLDataTool.h"
#import "MBProgressHUD.h"
#import "Masonry.h"

@interface ZLCategoryViewController()<ZLDropDownMenuDataSource, ZLDropDownMenuDelegate>

@property (nonatomic, strong) ZLDropDownMenu * dropDownMenu;

@end

@implementation ZLCategoryViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    self.view.backgroundColor = [UIColor purpleColor];
    _dropDownMenu = ({
        ZLDropDownMenu * menu = [[ZLDropDownMenu alloc] init];
        menu.delegate = self;
        menu.dataSource = self;
        [self.view addSubview:menu];
        [menu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.leading.trailing.mas_equalTo(0);
            make.height.equalTo(@300);
        }];
        menu;
    });
}

#pragma mark |---- ZLDropDownMenuDataSource
- (NSInteger)numberOfRowInMainTableView:(ZLDropDownMenu *)dropDownMenu{
    return [ZLDataTool categories].count;
}

- (NSString *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu titleForRowInMainTable:(NSInteger)row{
    ZLCategoryModel * model = [ZLDataTool  categories][row];
    return model.name;
}

- (NSString *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu normalIconForRow:(NSInteger)row{
    ZLCategoryModel * model = [ZLDataTool categories][row];
    return model.small_icon;
}

- (NSString *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu selectedIconForRow:(NSInteger)row{
    ZLCategoryModel * model = [ZLDataTool categories][row];
    return model.small_highlighted_icon;
}

- (NSArray *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu subTitleArrayOfRow:(NSInteger)row{
    ZLCategoryModel * model = [ZLDataTool categories][row];
    return model.subcategories;
}

- (void)dropDownMenu:(ZLDropDownMenu *)homeDropdown didSelectRowInMainTable:(NSInteger)row{
    ZLCategoryModel * model = [ZLDataTool  categories][row];
    [self showMessage:model.name duration:0.5];
    
}

- (void)dropDownMenu:(ZLDropDownMenu *)homeDropdown didSelectRowInSubTable:(NSInteger)subrow inMainTable:(NSInteger)mainRow{
    ZLCategoryModel * model = [ZLDataTool  categories][mainRow];
    [self showMessage:[NSString stringWithFormat:@"%@~~%@",model.name, model.subcategories[subrow]] duration:0.5];
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
