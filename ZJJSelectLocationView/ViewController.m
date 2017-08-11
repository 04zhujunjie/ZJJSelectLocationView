//
//  ViewController.m
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//
#import "ViewController.h"
#import "ZJJSelectLocationView.h"
#import "ZJJGameUserInfoModel.h"
#import "ZJJAnimationTool.h"
//我的ID
static NSInteger const kZJJMySysID = 10000;

@interface ViewController ()<ZJJSelectLocationViewDelegate>

@property (nonatomic ,strong) ZJJSelectLocationView *slView;
@property (nonatomic ,strong) ZJJGameUserInfoModel *myInfoModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupMyInfoModel];
    self.slView = [[ZJJSelectLocationView  alloc] initWithFrame:self.view.bounds];
    self.slView.delegate = self;
    [self.view addSubview:self.slView];
    
    [self setupOtherUser];
}

- (void)setupMyInfoModel{
    
    _myInfoModel = [ZJJGameUserInfoModel new];
    _myInfoModel.sysID = kZJJMySysID;
    _myInfoModel.betAmount = 10000;
    _myInfoModel.name = @"我";
    _myInfoModel.headerIcon = @"3";
}

- (void)setupOtherUser{
    
    NSInteger count = 4;
    for (int i = 0; i < count; i ++) {
        
        ZJJGameUserInfoModel *userInfoModel = [[ZJJGameUserInfoModel alloc] init];
        userInfoModel.name = [NSString stringWithFormat:@"小明00%ld",i+1];
        userInfoModel.betAmount = 1000+arc4random()%100;
        userInfoModel.position = (i+1)*i/2;
        userInfoModel.sysID = 10+i;
        userInfoModel.headerIcon = [NSString stringWithFormat:@"%ld",i%3];
        ZJJUserView *userView = [self.view viewWithTag:kZJJUserViewTag + userInfoModel.position];
        userView.model = userInfoModel;
    }
    
}

- (void)myAddGameAction:(UIButton *)btn{
    
    ZJJUserView *userView = (ZJJUserView *)[btn superview];
    NSLog(@"=====%ld======",userView.tag);
    
    if (userView.model.sysID) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"用户信息" message: [NSString stringWithFormat:@"\n用户名：%@\n初始位置：%ld\n 用户ID：%ld\n 移动后绝对位置：%ld",userView.model.name,userView.model.position,userView.model.sysID,[self getUserViewAbsolutePlaceWithTag:userView.tag]] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:act];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    //用来判断我是否已经坐下
    ZJJUserView *myUserView = [self findUserViewWithSysID:kZJJMySysID];
    
    if (myUserView || !userView.model.sysID) {
        myUserView.model = nil;
        [self setupMyInfoModel];
        _myInfoModel.position = userView.tag-kZJJUserViewTag;
        [ZJJAnimationTool myAddGameMoveAnimationWithView:self.slView UserModel:_myInfoModel finish:^{
            NSLog(@"==移动完成===");
        }];
        return;
    }
    
    
}


/**
 获取用户View

 @param sysID 用户ID
 @return 用户View
 */
- (ZJJUserView *)findUserViewWithSysID:(NSInteger)sysID{
    
    for (int i = 0; i < self.slView.userNum; i++) {
        
        ZJJUserView *userView = [self.view viewWithTag:kZJJUserViewTag+i];
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
    
    
    for (int i = 0; i < self.slView.userViewTagArray.count; i ++) {
        
        NSNumber *num  = self.slView.userViewTagArray[i];
        if ([num integerValue] == tag) {
            
            return i;
        }
        
    }
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
