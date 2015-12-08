//
//  VariableButton.m
//  VariableButton
//
//  Created by 金顺度 on 15/12/8.
//  Copyright © 2015年 金顺度. All rights reserved.
//

#import "VariableButton.h"

@implementation VariableButton{
    NSTimer *_timer;
    int _countNumber;
}

- (void)drawRect:(CGRect)rect {
    _countNumber = self.neededTime;
    [self setUpButton];
}
- (void)setUpButton {
    [self setTitle:self.beforeText forState:UIControlStateNormal];
    [self setTitleColor:self.textColor forState:UIControlStateNormal];
    [self setBackgroundColor:self.bgColor];
    [self addTarget:self action:@selector(receiveCode) forControlEvents:UIControlEventTouchUpInside];
    [self setBackgroundImage:[UIImage imageNamed:self.normalBgImageName] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:self.highlightedBgImageName] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage imageNamed:self.selectedBgImageName] forState:UIControlStateSelected];
    [self setImage:[UIImage imageNamed:self.normalImageName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:self.highlightedImageName] forState:UIControlStateHighlighted];
    [self setImage:[UIImage imageNamed:self.selectedImageName] forState:UIControlStateSelected];
}
- (void)receiveCode {
    if ([self.delegate respondsToSelector:@selector(variableButtonClick)]) {
        [self.delegate variableButtonClick];
    }
    [self startCounting];
}
- (void)startCounting {
    self.userInteractionEnabled = NO;
    NSArray *arr = [self.setText componentsSeparatedByString:@"/"];
    [self setTitle:[NSString stringWithFormat:@"%@%d%@", arr.firstObject,_countNumber-1,arr.lastObject] forState:UIControlStateNormal];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(closeTimer) userInfo:nil repeats:YES];
}
- (void)closeTimer {
    self.userInteractionEnabled = NO;
    NSArray *arr = [self.setText componentsSeparatedByString:@"/"];
    [self setTitle:[NSString stringWithFormat:@"%@%d%@", arr.firstObject,_countNumber-2,arr.lastObject] forState:UIControlStateNormal];
    _countNumber = _countNumber-1;
    if (_countNumber == 0) {
        [_timer invalidate];
        [self setTitle:self.afterText forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        _countNumber = self.neededTime;
    }
}

@end
