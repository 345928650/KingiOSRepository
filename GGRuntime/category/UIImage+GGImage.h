//
//  UIImage+GGImage.h
//  GGRuntime
//
//  Created by king w on 2017/4/26.
//  Copyright © 2017年 king. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GGImage)

@property (strong, nonatomic) NSString * name;


//自定义的方法
+ (__kindof UIImage *) gg_imageName:(NSString *)imageName;

@end
