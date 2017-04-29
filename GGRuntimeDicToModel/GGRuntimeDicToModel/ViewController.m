//
//  ViewController.m
//  GGRuntimeDicToModel
//
//  Created by king w on 2017/4/26.
//  Copyright © 2017年 king. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+Model.h"

#import "Status.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray * dictArr = dict[@"statuses"];
    
    NSMutableArray * statuses = [NSMutableArray array];
    //遍历指点数组
    for (NSDictionary * dict in dictArr) {
        
        [Status modelWithDict:dict];
    }
    
    UIButton
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
