//
//  ZJJUserView.h
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJJGameUserInfoModel.h"

@interface ZJJUserView : UIView

@property (nonatomic ,strong) ZJJGameUserInfoModel *model;

//名字
@property (nonatomic ,strong)UILabel *nameLabel;
//我的筹码
@property (nonatomic ,strong)UILabel *betAmountLabel;

@property (nonatomic ,strong)UIButton *emptyBtn;

@property (nonatomic ,strong)UIImageView *imageView;

@end
