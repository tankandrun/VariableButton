//
//  ViewController.m
//  VariableButton
//
//  Created by 金顺度 on 15/12/8.
//  Copyright © 2015年 金顺度. All rights reserved.
//

#import "ViewController.h"
#import "VariableButton.h"

@interface ViewController ()<VariableButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    VariableButton *button = [[VariableButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.delegate = self;
    [self.view addSubview:button];
    button.neededTime = 5;
    button.beforeText = @"获取验证码";
    button.afterText = @"重新获取";
    button.setText = @"asjfas/s";
    button.textColor = [UIColor redColor];
}
- (void)variableButtonClick {
    NSLog(@"gogogo");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
