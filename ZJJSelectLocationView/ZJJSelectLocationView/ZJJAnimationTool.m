//
//  ZJJAnimationTool.m
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//

#import "ZJJAnimationTool.h"

@implementation ZJJAnimationTool


+ (void)myAddGameMoveAnimationWithView:(ZJJSelectLocationView *)slView UserModel:(ZJJGameUserInfoModel *)userModel finish:(void(^)())finish{
    //获取用户点击视图的Tag
    NSInteger tag = kZJJUserViewTag+userModel.position;
    NSInteger tagIndex = 0;
    NSInteger startIndex = 0;
    for (int i = 0; i < slView.userNum; i ++) {
        
        NSNumber *num  = slView.userViewTagArray[i];
        if ([num integerValue] == tag) {
            //获取用户在屏幕上的绝对位置
            tagIndex = i;
        }
    }
    NSMutableArray *userArray = [NSMutableArray array];
    int index = 0;
    //获取点击位置与0位置相间隔多少个位置
    NSInteger differ = slView.userNum - tagIndex;
    
    for (NSInteger i = tagIndex; i < tagIndex+slView.userNum; i ++) {
        ZJJUserView *startUserView;
        //用户最后的中心位置
        CGPoint userViewEndPoint = CGPointZero;

        
        if (i < slView.userViewTagArray.count) {
            
            startUserView = [slView viewWithTag:[slView.userViewTagArray[i] integerValue]];
            //记录最新人物视图View的Tag
            NSNumber *numIndex = slView.userViewTagArray[i];
            startIndex = i;
            //设置我的信息
            if (index == 0) {
                startUserView.model = userModel;
            }
            [userArray addObject:numIndex];
            //用户移动最后位置
            userViewEndPoint = [slView.userViewPointArray[index] CGPointValue];
        }
        //0位置开始移动
        if (i >= slView.userNum) {
            
            startUserView = [slView viewWithTag:[slView.userViewTagArray[i-9] integerValue]];
            startIndex = i-9;
            NSInteger endIndex = i-slView.userNum+differ;
            //用户移动最后位置
            userViewEndPoint = [slView.userViewPointArray[endIndex] CGPointValue];
            NSNumber *numIndex = slView.userViewTagArray[i-slView.userNum];
            [userArray addObject:numIndex];
            
        }
        index ++;
        [UIView animateWithDuration:0.4 animations:^{
            startUserView.center = userViewEndPoint;
            
        } completion:^(BOOL finished) {
            //说明我坐下动画已经结束后回调方法
            if (index == slView.userNum) {
                finish();
            }
        }];

    }
    [slView.userViewTagArray removeAllObjects];
    [slView.userViewTagArray addObjectsFromArray:userArray];
}

@end
