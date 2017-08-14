//
//  ZJJSelectLocationView.h
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJJUserView.h"

@protocol ZJJSelectLocationViewDelegate <NSObject>

- (void)myAddGameAction:(UIButton *)btn;

@end

//用户基础Tag
#define kZJJUserViewTag 600

@interface ZJJSelectLocationView : UIView

@property (nonatomic ,weak) id <ZJJSelectLocationViewDelegate> delegate;
/**人数*/
@property (nonatomic ,assign) NSInteger userNum;
//用户中心点位置
@property (nonatomic ,strong)NSArray *userViewPointArray;
//用户手动点击添加进来，移动后存放用户Tag
@property (nonatomic ,strong)NSMutableArray *userViewTagArray;

/**
 获取用户View
 
 @param sysID 用户ID
 @return 用户View
 */
- (ZJJUserView *)findUserViewWithSysID:(NSInteger)sysID;
/**
 *  获取在桌面的绝对位置
 *
 *  @param tag 用户的Tag
 *
 *  @return 桌面的绝对位置
 */
- (NSInteger)getUserViewAbsolutePlaceWithTag:(NSInteger)tag;

@end
