//
//  ZLDropDownMenu.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ZLDropDownMenu.h"
#import "ZLDropMenuMainCell.h"
#import "ZLDropMenuSubCell.h"
#import "Masonry.h"

@interface ZLDropDownMenu()<UITableViewDataSource, UITableViewDelegate>
//主表
@property (nonatomic, strong) UITableView * mainTableView;
//从表
@property (nonatomic, strong) UITableView * subTableView;
//主表中选中的行数
@property (nonatomic, assign) NSInteger selectRowOfMaintableView;

@end


@implementation ZLDropDownMenu


- (instancetype)init{
    self = [super init];
    if (self) {
        _mainTableView = ({
            UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
            tableView.delegate = self;
            tableView.dataSource = self;
            [self addSubview:tableView];
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.top.bottom.mas_equalTo(0);
            }];
            tableView;
        });
        
        _subTableView = ({
            UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
            tableView.delegate = self;
            tableView.dataSource = self;
            [self addSubview:tableView];
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.trailing.top.bottom.mas_equalTo(0);
                make.width.equalTo(_mainTableView.mas_width);
                make.leading.equalTo(_mainTableView.mas_trailing);
            }];
            tableView;
        });
    }
    return self;
}

#pragma mark |---- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        return [self.dataSource numberOfRowInMainTableView:self];
    }else{
        return [self.dataSource dropDownMenu:self subTitleArrayOfRow:
                self.selectRowOfMaintableView].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = nil;
    if (tableView == self.mainTableView) {
        cell = [ZLDropMenuMainCell cellWithTableView:tableView];
        cell.textLabel.text = [self.dataSource dropDownMenu:self titleForRowInMainTable:indexPath.row];
        if ([self.dataSource respondsToSelector:@selector(dropDownMenu:normalIconForRow:)]) {
            cell.imageView.image = [UIImage imageNamed:[self.dataSource dropDownMenu:self normalIconForRow:indexPath.row]];
        }
        
        if ([self.dataSource respondsToSelector:@selector(dropDownMenu:selectedIconForRow:)]) {
            cell.imageView.highlightedImage = [UIImage imageNamed:[self.dataSource dropDownMenu:self selectedIconForRow:indexPath.row]];
        }
        
        NSArray * subTableViewDataArr = [self.dataSource dropDownMenu:self subTitleArrayOfRow:indexPath.row];
        
        cell.accessoryType = (subTableViewDataArr.count ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone);
    }else if(tableView == self.subTableView){
        cell = [ZLDropMenuSubCell cellWithTableView:tableView];
        NSArray * subTableViewDataArr = [self.dataSource dropDownMenu:self subTitleArrayOfRow:self.selectRowOfMaintableView];
        cell.textLabel.text = subTableViewDataArr[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0000001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0000001;
}



#pragma mark |---- UITableViewCellDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // if select the row of mainTableView
    if (tableView == self.mainTableView) {
        //the row of mainTableView has selected
        self.selectRowOfMaintableView = indexPath.row;
        //reload subTableView
        [self.subTableView reloadData];
        [self.subTableView setContentOffset:CGPointZero animated:YES];
        //call dropDownMenu:didSelectRowInMainTable:
        if(self.delegate && [self.delegate respondsToSelector:@selector(dropDownMenu:didSelectRowInMainTable:)]){
            [self.delegate dropDownMenu:self didSelectRowInMainTable:indexPath.row];
        }
    }else if(tableView == self.subTableView){// if select the row of subTableView
        if ([self.delegate respondsToSelector:@selector(dropDownMenu:didSelectRowInSubTable:inMainTable:)]) {
            [self.delegate dropDownMenu:self didSelectRowInSubTable:indexPath.row inMainTable:self.selectRowOfMaintableView];
        }
    }
}


@end
