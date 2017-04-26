//
//  person.m
//  GGRuntime
//
//  Created by king w on 2017/4/26.
//  Copyright © 2017年 king. All rights reserved.
//

#import "person.h"

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

@end
