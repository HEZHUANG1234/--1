//
//  ActivityListCell.h
//  Douban
//
//  Created by wp on 14-11-8.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Activity;

@interface ActivityListCell : UITableViewCell

@property (nonatomic,retain,readonly) UIImageView * activityImageView;

@property (nonatomic,retain) Activity * activity;

@end
