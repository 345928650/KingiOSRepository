//
//  NSObject+Model.m
//  GGRuntimeDicToModel
//
//  Created by king w on 2017/4/26.
//  Copyright © 2017年 king. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/message.h>

@implementation NSObject (Model)

+ (instancetype) modelWithDict:(NSDictionary *)dic{

    //runtime：遍历模型中所有属性名，去字典中查找
    //属性定义在哪，定义在类，类里面有个属性列表{数组}
    //遍历模型所有属性名
    //ivar:成员属性
    //class_copyIvarList:是把成员属性列表复制一份
    //Ivar* ： 指向一个ivar数组的指针
    //class:获取那个类的成员属性列表
    unsigned int count = 0;
    Ivar * ivarlist = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarlist[i];
        
        //成员属性名
        NSString * propertyName =  [NSString stringWithUTF8String:ivar_getName(ivar)];
    
        //类型
        NSString * propertyType =  [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        NSLog(@"%u %@ %@",count,propertyName, propertyType);
    }
    

    
    return nil;
}

@end
