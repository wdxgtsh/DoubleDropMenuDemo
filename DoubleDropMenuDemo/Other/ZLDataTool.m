//
//  ZLDataTool.m
//  DoubleDropMenuDemo
//
//  Created by zhaolei on 16/7/7.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ZLDataTool.h"
#import "ZLCategoryModel.h"
#import "MJExtension.h"

@implementation ZLDataTool

static NSArray *_categories;
+ (NSArray *)categories
{
    if (_categories == nil) {
        _categories = [ZLCategoryModel objectArrayWithFilename:@"categories.plist"];;
    }
    return _categories;
}


@end
