//
//  VariableButton.h
//  VariableButton
//
//  Created by 金顺度 on 15/12/8.
//  Copyright © 2015年 金顺度. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VariableButtonDelegate <NSObject>
@optional
- (void)variableButtonClick;

@end









@interface VariableButton : UIButton
@property (nonatomic, weak) id<VariableButtonDelegate> delegate;

//设置需要倒计时的时间
@property (nonatomic) int neededTime;
//设置倒计时前需要显示的文本
@property (nonatomic,strong) NSString *beforeText;
//设置倒计时时需要显示的文本,以／分隔
@property (nonatomic,strong) NSString *setText;
//设置完成倒计时后的文本
@property (nonatomic,strong) NSString *afterText;
//设置图片
@property (nonatomic, copy) NSString *normalImageName;
@property (nonatomic, copy) NSString *highlightedImageName;
@property (nonatomic, copy) NSString *selectedImageName;
//设置背景图片
@property (nonatomic, copy) NSString *normalBgImageName;
@property (nonatomic, copy) NSString *highlightedBgImageName;
@property (nonatomic, copy) NSString *selectedBgImageName;
//背景颜色
@property (nonatomic,strong) UIColor *bgColor;
//字体颜色
@property (nonatomic,strong) UIColor *textColor;


@end
