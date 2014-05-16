//
//  TGDock.h
//  ITuanGou
//
//  Created by wangtao on 14-5-16.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TGDock;
@protocol ITGDockDelegate <NSObject>

@optional
- (void)dock:(TGDock *)dock didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;
@end
@interface TGDock : UIView
@property (nonatomic, weak) id<ITGDockDelegate> delegate;
@end
