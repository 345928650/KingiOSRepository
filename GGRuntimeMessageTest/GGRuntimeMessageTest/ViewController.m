//
//  ViewController.m
//  GGRuntimeMessageTest
//
//  Created by king w on 2017/4/27.
//  Copyright © 2017年 king. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、验证super和self调用方法时的异同
//    [self testSelfOrSuperMessage];
    
//    [self methodStaticCall];
    
    //2、调用一个不存在的方法，验证动态加载方法
//    [self performSelector:@selector(doSomething:)];
    
    //3、调用一个没实现的方法，验证消息转发
    [self performSelector:@selector(secondVCMethod)];
    
    
    
}



//测试super和self对像返回类名异同
- (void) testSelfOrSuperMessage{
    //__unsafe_unretained

    
    NSLog(@"Super： %@",NSStringFromClass([super class]));
    NSLog(@"self： %@",NSStringFromClass([self class]));
    
    /* 打印结果
     2017-04-27 13:15:35.047864+0800 GGRuntimeMessageTest[7795:4093340] Super： ViewController
     2017-04-27 13:15:35.047936+0800 GGRuntimeMessageTest[7795:4093340] self： ViewController
     */
    
    //说明:super和self接收的消息都是指向当前类的指针，不同之处在于super只是告诉编译器，调用方法是要去调用父类的class方法而不是本类；其实self和super调用的都是NSObject定义的方法，输出本类的类名；
}




//==============================
//方法没实现时系统会默认调用这个方法，可用于动态添加方法
//+(BOOL) resolveInstanceMethod:(SEL)sel{
//
//    if (sel == @selector(doSomething:)) {
//        
//        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");  //动态添加一个方法
//        return YES;
//    }
//    return NO;
//}
//
////动态替换方法
//void dynamicMethodIMP(id self, SEL _cmd){
//
//    NSLog(@"动态添加方法!!!");
//}




//==============================
//方法没实现时，系统会调用这个方法
+(BOOL) resolveInstanceMethod:(SEL)sel{

    return [super resolveInstanceMethod:sel];
}

//验证消息转发，方法没实现时，系统自动调用这个方法；常用于消息转发
- (id) forwardingTargetForSelector:(SEL)aSelector{

    NSLog(@"forwardingTargetForSelector:方法执行了！！！");
    Class class = NSClassFromString(@"SecondViewController");   //获取能执行没实现方法的类
    UIViewController * ctl = class.new;  //实例类
    if (aSelector == NSSelectorFromString(@"secondVCMethod")) {  //判断是否为指定的方法
        
        return ctl;
    }
    
    return nil;
}



//- (void) methodStaticCall{
//    
//    void (*setter)(id, SEL, BOOL);
//    setter = (void (*)(id,SEL,BOOL))[self methodForSelector:@selector(testSelfOrSuperMessage)];
//    for (int i = 0; i < 100; i++) {
//        setter();
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
