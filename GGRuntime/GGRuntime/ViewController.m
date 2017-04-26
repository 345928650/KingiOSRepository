//
//  ViewController.m
//  GGRuntime
//
//  Created by king w on 2017/4/25.
//  Copyright © 2017年 king. All rights reserved.
//

#import "ViewController.h"

#import "person.h"

#import "UIImage+GGImage.h"

#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    //runtime 对象方法和类对象调用方法
//    person * p = [[person alloc] init];
//    
//    objc_msgSend(p, @selector(eat));
//    
//    objc_msgSend(p, @selector(run:), 100);
//    
//    [person classeat];  //类调用
//    
//    [[person class] classeat]; //类对象调用 和 类调用一样的意思
//    
//    objc_msgSend([person class], @selector(classeat));  //用runtime的类对象调用
    
    
    
    //runtime 方法替换
//    UIImage * img = [UIImage imageNamed:@"123"];
//    UIImage *img = [UIImage imageNamed:@"123"];    //在类别中用runtime已经在load周期方法中交换了系统方法和自定义方法；
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
