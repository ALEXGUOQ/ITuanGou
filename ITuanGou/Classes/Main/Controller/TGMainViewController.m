//
//  TGMainViewController.m
//  ITuanGou
//
//  Created by wangtao on 14-5-15.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "TGMainViewController.h"
#import "TGDock.h"
#import "TGCollectViewController.h"
#import "TGDealViewController.h"
#import "TGMineViewController.h"
#import "TGMapViewController.h"
@interface TGMainViewController ()<ITGDockDelegate>

@end

@implementation TGMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
#warning 临时设置颜色
	self.view.backgroundColor = [UIColor brownColor];
    //添加左侧栏的方法
    [self addDock];
    //添加所有的子控制器
    [self addAllChildVcs];
}
/**
 *  添加左侧栏的方法
 */
-(void)addDock
{
    TGDock *dock = [[TGDock alloc]init];
    dock.delegate = self;
    dock.frame = CGRectMake(0, 0, 0, self.view.frame.size.height);
    [self.view addSubview:dock];
}
/**
 *  添加所有的子控制器
 */
-(void)addAllChildVcs
{
    //1团购
    TGDealViewController *deal = [[TGDealViewController alloc]init];
    deal.view.backgroundColor = [UIColor redColor];
    [self addOneChildVc:deal];
    
    // 2.地图
    TGMapViewController *map = [[TGMapViewController alloc] init];;
    map.view.backgroundColor = [UIColor blueColor];
    [self addOneChildVc:map];
    
    // 3.收藏
    TGCollectViewController *collect = [[TGCollectViewController alloc] init];;
    collect.view.backgroundColor = [UIColor grayColor];
    [self addOneChildVc:collect];
    
    // 4.我的
    TGMineViewController *mine = [[TGMineViewController alloc] init];;
    mine.view.backgroundColor = [UIColor greenColor];
    [self addOneChildVc:mine];
//    [self dock:nil didSelectButtonFrom:0 to:0];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self dock:nil didSelectButtonFrom:0 to:0];
}
/**
 *  添加一个子控制器
 *
 *  @param vc <#vc description#>
 */
- (void)addOneChildVc:(UIViewController *)vc
{
    //1.包装导航控制器（保证拥有导航条）
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    //2添加导航控制器为main控制器的子控制器
    [self addChildViewController:nav];
    
}
-(void)dock:(TGDock *)dock didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
    //1移除旧的控制器的view
    UIViewController *oldVc = self.childViewControllers[from];
    [oldVc.view removeFromSuperview];
    //2添加新的控制器的view
    UIViewController *newVc = self.childViewControllers[to];
    newVc.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //3设置view的尺寸
    CGFloat newVcH;
    CGFloat newVcW;
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {//横屏
        newVcH = self.view.frame.size.width;
        newVcW = self.view.frame.size.height - ITGDockButtonW;
    }else
    {
        newVcH = self.view.frame.size.height;
        newVcW = self.view.frame.size.width - ITGDockButtonW;
    }
    newVc.view.frame = CGRectMake(ITGDockButtonW, 0, newVcW, newVcH);
    [self.view addSubview:newVc.view];
}
@end
