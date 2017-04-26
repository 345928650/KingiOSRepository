//
//  UIImage+GGImage.m
//  GGRuntime
//
//  Created by king w on 2017/4/26.
//  Copyright © 2017年 king. All rights reserved.
//

#import "UIImage+GGImage.h"

#import <objc/message.h>

@implementation UIImage (GGImage)

+ (void) load{
    
    NSLog(@"%s",__func__);
    
    //交换方法
    
    //获取方法实现
//    class_getMethodImplementation(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    //获取类方法
//    class_getClassMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    //获取对象方法
//    class_getInstanceMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    
    [self methodChangeIementations];
}


//交换imageNamed:和 gg_imageName:
+ (void) methodChangeIementations{

    //获取类的方法
    //Class:获取类的方法
    //SEL:获取方法编号，根据SEL就能去对应的类找方法
    Method imgName =  class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    //用这个方法替换系统原有方法
    Method ggImgName = class_getClassMethod([UIImage class], @selector(gg_imageName:));
    
    //方法交换
    method_exchangeImplementations(ggImgName, imgName);
}


+ (__kindof UIImage *) gg_imageName:(NSString *)imageName{

    UIImage *img = [UIImage gg_imageName :imageName]; //由于方法交换了，调用这个方法就等于调用系统的imageNamed：方法
    if (!img) {
        NSLog(@"这个为“%@”的图片资源没找到！！！",imageName);
    }
    return img;
}

@end
