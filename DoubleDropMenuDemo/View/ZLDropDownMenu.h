//
//  ZLDropDownMenu.h
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLDropDownMenu;

@protocol ZLDropDownMenuDataSource <NSObject>

@required
/**
 *  how many rows in mainTableView
 *
 *  @param dropDownMenu instancetype of ZLDropDownMenu
 *
 *  @return number of rows in dropDownMenu
 */
- (NSInteger)numberOfRowInMainTableView:(ZLDropDownMenu *)dropDownMenu;

/**
 *  return the title of cell in mainTableView
 *
 *  @param dropDownMenu instancetype of ZLDropDownMenu
 *  @param row          row
 *
 *  @return the title of cell in mainTableView
 */
- (NSString *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu titleForRowInMainTable:(NSInteger)row;

/**
 *   the subTableView's datasource array
 *
 *  @param dropDownMenu instance of ZLDropDownMenu
 *  @param row    row
 *
 *  @return the subTableView's datasource array
 */
- (NSArray *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu subTitleArrayOfRow:(NSInteger)row;

@optional
/**
 *  the icon name of mainTableView (normal state)
 *
 *  @param dropDownMenu instance of ZLDropDownMenu
 *  @param row          row description
 *
 *  @return the icon name of each cell in mainTableView(normal state)
 */
- (NSString *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu normalIconForRow:(NSInteger)row;

/**
 *  the icon name of mainTableView (selected state)
 *
 *  @param dropDownMenu instance of ZLDropDownMenu
 *  @param row          row description
 *
 *  @return the icon name of each cell in mainTableView(selected state)
 */
- (NSString *)dropDownMenu:(ZLDropDownMenu *)dropDownMenu selectedIconForRow:(NSInteger)row;
@end

@protocol ZLDropDownMenuDelegate <NSObject>
/**
 *  select the row in maintableView
 *
 *  @param homeDropdown instance of ZLDropDownMenu
 *  @param row          the row whice has selected
 */
- (void)dropDownMenu:(ZLDropDownMenu *)homeDropdown didSelectRowInMainTable:(NSInteger)row;

/**
 *  select the row in subTableView and the row int maintableView
 *
 *  @param homeDropdown instance of ZLDropDownMenu
 *  @param subrow       the selected row in subTableView
 *  @param mainRow      the selected row in mainTableView
 */
- (void)dropDownMenu:(ZLDropDownMenu *)homeDropdown didSelectRowInSubTable:(NSInteger)subrow inMainTable:(NSInteger)mainRow;

@end

@interface ZLDropDownMenu : UIView

@property(nonatomic, weak) id<ZLDropDownMenuDelegate> delegate;

@property(nonatomic, weak) id<ZLDropDownMenuDataSource> dataSource;

@end
