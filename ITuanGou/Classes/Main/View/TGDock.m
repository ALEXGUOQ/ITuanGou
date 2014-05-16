//
//  TGDock.m
//  ITuanGou
//
//  Created by wangtao on 14-5-16.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "TGDock.h"
#import "TGMoreButton.h"
#import "TGLocationButton.h"
#import "TGTabButton.h"
@interface TGDock()
{
    TGTabButton *_selectedButton;
}
@end
@implementation TGDock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //0dock的高度需要自动伸缩
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
       //1设置dock的背景色
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tabbar"]];
        //2添加LOGO
        UIImageView *logo = [[UIImageView alloc]init];
        logo.frame = CGRectMake(0, 0, ITGDockButtonW, ITGDockButtonH);
        logo.image = [UIImage imageNamed:@"ic_logo"];
        logo.contentMode = UIViewContentModeCenter;
        [self addSubview:logo];
        //3添加按钮
        //3.1添加更多按钮
        TGMoreButton *more = [TGMoreButton button];
        CGFloat moreY = self.frame.size.height - ITGDockButtonH;
        more.frame = CGRectMake(0, moreY, 0, 0);
        [self addSubview:more];
        //3.2添加定位按钮
        TGLocationButton *loc = [TGLocationButton button];
        CGFloat locY = moreY - ITGDockButtonH;
        loc.frame = CGRectMake(0, locY, ITGDockButtonW, ITGDockButtonH);
        [self addSubview:loc];
        //3.3添加选项卡按钮
        [self addTabButtonWithImage:@"ic_deal" selectedImage:@"ic_deal_hl" index:1];
        [self addTabButtonWithImage:@"ic_map" selectedImage:@"ic_map_hl" index:2];
        [self addTabButtonWithImage:@"ic_collect" selectedImage:@"ic_collect_hl" index:3];
        [self addTabButtonWithImage:@"ic_mine" selectedImage:@"ic_mine_hl" index:4];
        //4添加底部的分割线
        UIImageView *divider = [[UIImageView alloc]init];
        divider.image = [UIImage imageNamed:@"separator_tabbar_item"];
        divider.frame = CGRectMake( 0, ITGDockButtonH * 5, ITGDockButtonW, 2);
        [self addSubview:divider];
    }
    return self;
}
/**
 *  添加一个选项卡按钮
 *
 *  @param image         默认图片
 *  @param selectedImage 选中图片
 *  @param index         按钮的位置
 */
- (void)addTabButtonWithImage:(NSString *)image selectedImage:(NSString *)selectedImage index:(NSUInteger)index
{
    //1创建按钮
    TGTabButton *button = [TGTabButton button];
    //2设置图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    //3设置尺寸
    button.frame = CGRectMake(0, ITGDockButtonH * index, 0, 0);
    
    //4监听按钮
    [button addTarget:self action:@selector(tabButtonDown:) forControlEvents:UIControlEventTouchDown];
    button.tag = index - 1;
    
    [self addSubview:button];
    //5如果是第一个选项卡按钮默认选中
    if (index == 1) {
        [self tabButtonDown:button];
    }
}
/**
 *  点击按钮事件
 */
- (void)tabButtonDown:(TGTabButton *)button
{
    //1通知代理
    if ([self.delegate respondsToSelector:@selector(dock:didSelectButtonFrom:to:)]) {
        [self.delegate dock:self didSelectButtonFrom:_selectedButton.tag to:button.tag];
    }
//    ITGLog(@"%d---------%d",_selectedButton.tag,button.tag);
    //2设置按钮状态的三步
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
}
-(void)setFrame:(CGRect)frame
{
    frame.size.width = ITGDockButtonW;
    [super setFrame:frame];
}
-(void)setBounds:(CGRect)bounds
{
    bounds.size.width = ITGDockButtonW;
    [super setBounds:bounds];
    
}
@end
