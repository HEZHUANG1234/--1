//
//  ImageDownloader.h
//  Lesson36Kr
//
//  Created by wp on 14-11-8.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ImageDownloader;
@protocol ImageDownloaderDelegate <NSObject>

- (void)imageDownloader:(ImageDownloader *)downloader finishLoadImage:(UIImage *)image;

@end

@interface ImageDownloader : NSObject

@property (nonatomic, copy)NSString *urlString;
@property (nonatomic, assign)id <ImageDownloaderDelegate>delegate;


//给一个 url字符串创建一个下载器，下载URL对应的图片
- (instancetype)initWithURLString:(NSString *)urlStr delegate:(id<ImageDownloaderDelegate>)delegate;


- (void)startDownload;

@end
