//
//  person.m
//  GGRuntime
//
//  Created by king w on 2017/4/26.
//  Copyright © 2017年 king. All rights reserved.
//

#import "person.h"

#import <objc/message.h>

@implementation person

- (void) eat{
    
    NSLog(@"吃东西！！！");
}

+ (void) classeat{
    
    NSLog(@"类对象吃东西！！！");
}

- (void) run:(int)num{
    
    NSLog(@"跑了：%u步",num);
}


//自定义动态C函数
void aaaa(id self, SEL _cmd, id param1){

    NSLog(@"调用了动态方法！ %@ %@ %@",self, NSStringFromSelector(_cmd), param1);
}




//这个方法是系统方法，在被调用的方法没实现的时候系统会默认调用
+ (BOOL) resolveInstanceMethod:(SEL)aSEL
{
    //方法编号比较
    if (aSEL == @selector(eat:))
    {
        //使用runtime调用自定义动态方法
        class_addMethod(self, aSEL, (IMP)aaaa, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}


@end
