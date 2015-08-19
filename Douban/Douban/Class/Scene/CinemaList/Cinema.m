//
//  Cinema.m
//  Douban
//
//  Created by wp on 14-11-8.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.cinemaId = value;
    }
}

@end
