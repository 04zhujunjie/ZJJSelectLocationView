//
//  ZJJGameUserInfoModel.h
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJJGameUserInfoModel : NSObject

//位置
@property (nonatomic ,assign) NSInteger position;
//用户名
@property (nonatomic ,copy) NSString *name;
//用户ID
@property (nonatomic ,assign) NSInteger sysID;
//筹码
@property (nonatomic ,assign) NSInteger betAmount;
//头像
@property (nonatomic ,copy) NSString *headerIcon;


@end
