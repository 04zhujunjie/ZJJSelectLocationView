//
//  ZJJSelectLocationView.m
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//

#import "ZJJSelectLocationView.h"


@interface ZJJSelectLocationView ()


//用户View宽度
@property (nonatomic ,assign) CGFloat userViewWidth;
//用户View高度
@property (nonatomic ,assign) CGFloat userViewHight;

@end

@implementation ZJJSelectLocationView


- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //初始化数组
        [self initArray];
        
    }
    return self;
}

- (void)initArray{
    

    self.userNum = 9;
    self.userViewWidth = 50;
    self.userViewHight = 90;
    _userViewTagArray = [NSMutableArray array];
    for (int i = 0; i < self.userNum; i ++) {
        [_userViewTagArray addObject:[NSNumber numberWithInteger:i+kZJJUserViewTag]];
    }
    [self createHeadImagePoint:CGRectMake(15,25, self.frame.size.width-30, self.frame.size.height) imageSize:CGSizeMake(self.userViewWidth, self.userViewHight)];
    //============创建人物视图=========
    for (int  i = 0 ; i < self.userViewPointArray.count; i ++) {
        
        //创建人物视图
        ZJJUserView *userView = [[ZJJUserView alloc] initWithFrame:CGRectMake(0, 0, self.userViewWidth, self.userViewHight)];
        userView.model = nil;
        userView.tag = kZJJUserViewTag +i;
        NSValue *valuePoint = self.userViewPointArray[i];
        CGPoint point = [valuePoint CGPointValue];
        userView.center = point;
        [self addSubview:userView];
        UIButton *myHeadBtn = [[UIButton alloc] initWithFrame:userView.emptyBtn.frame];
        myHeadBtn.backgroundColor = [UIColor clearColor];
        [userView addSubview:myHeadBtn];
        [myHeadBtn addTarget:self action:@selector(myAddGameAction:) forControlEvents:UIControlEventTouchUpInside];
        [userView addSubview:myHeadBtn];
    }
}

- (void)myAddGameAction:(UIButton *)button{

    if ([self.delegate respondsToSelector:@selector(myAddGameAction:)]) {
        [self.delegate myAddGameAction:button];
    }
}

/**
 获取用户View
 
 @param sysID 用户ID
 @return 用户View
 */
- (ZJJUserView *)findUserViewWithSysID:(NSInteger)sysID{
    
    for (int i = 0; i < self.userNum; i++) {
        
        ZJJUserView *userView = [self viewWithTag:kZJJUserViewTag+i];
        if (userView.model.sysID == sysID) {
            
            return userView;
        }
    }
    return nil;
}

#pragma mark ===================获取移动后用户视图的绝对位置=================
/**
 *  获取在桌面的绝对位置
 *
 *  @param tag 用户的Tag
 *
 *  @return 桌面的绝对位置
 */
- (NSInteger)getUserViewAbsolutePlaceWithTag:(NSInteger)tag{
    
    
    for (int i = 0; i < self.userViewTagArray.count; i ++) {
        
        NSNumber *num  = self.userViewTagArray[i];
        if ([num integerValue] == tag) {
            
            return i;
        }
        
    }
    return 0;
}

#pragma mark ==========设置用户位置的中心坐标＝＝＝＝＝＝＝＝＝
- (void)createHeadImagePoint:(CGRect)rect imageSize:(CGSize)size{
    
    CGFloat x =rect.origin.x+size.width/2.0 ;
    CGFloat y = rect.origin.y+size.height/2.0;
    CGFloat w = rect.size.width-size.width;
    CGFloat h = rect.size.height-size.height/2.0;
    
    CGFloat hy = rect.size.height - size.height-30;
    
    CGPoint point1 = CGPointMake(rect.origin.x+rect.size.width/2.0, h);
    CGPoint point2 = CGPointMake(x, hy*3.0/4.0+size.width/2.0);
    CGPoint point3 = CGPointMake(x, hy*2.0/4.0+size.width/2.0);
    CGPoint point4 = CGPointMake(x, hy*1.0/4.0+size.width/2.0);
    CGPoint point5 = CGPointMake(x+w*1/3.0, y);
    CGPoint point6 = CGPointMake(x+w*2/3.0, y);
    CGPoint point7 = CGPointMake(x+w, hy*1.0/4.0+size.width/2.0);
    CGPoint point8 = CGPointMake(x+w, hy*2/4.0+size.width/2.0);
    CGPoint point9 = CGPointMake(x+w, hy*3/4.0+size.width/2.0);
    
    self.userViewPointArray = @[
                                [NSValue valueWithCGPoint:point1],
                                [NSValue valueWithCGPoint:point2],
                                [NSValue valueWithCGPoint:point3],
                                [NSValue valueWithCGPoint:point4],
                                [NSValue valueWithCGPoint:point5],
                                [NSValue valueWithCGPoint:point6],
                                [NSValue valueWithCGPoint:point7],
                                [NSValue valueWithCGPoint:point8],
                                [NSValue valueWithCGPoint:point9],
                                ];
    
}

@end
