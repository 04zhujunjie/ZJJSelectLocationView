//
//  ZJJAnimationTool.h
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJJSelectLocationView.h"
#import "ZJJGameUserInfoModel.h"

@interface ZJJAnimationTool : NSObject

+ (void)myAddGameMoveAnimationWithView:(ZJJSelectLocationView *)slView UserModel:(ZJJGameUserInfoModel *)userModel finish:(void(^)())finish;

@end
