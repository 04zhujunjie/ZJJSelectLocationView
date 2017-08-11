//
//  ZJJUserView.m
//  ZJJSelectLocationView
//
//  Created by xiaozhu on 2017/8/11.
//  Copyright © 2017年 xiaozhu. All rights reserved.
//

#import "ZJJUserView.h"
//用户头像下面的筹码的高度
#define userBetH 20

@implementation ZJJUserView

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.betAmountLabel];
        [self addSubview:self.emptyBtn];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)setModel:(ZJJGameUserInfoModel *)model{
    
    _model = model;
    if (_model) {
        
        self.nameLabel.hidden = NO;
        self.betAmountLabel.hidden = NO;
        self.imageView.hidden = NO;
        self.userInteractionEnabled = YES;
        self.emptyBtn.hidden = YES;
        self.emptyBtn.enabled = NO;
        [self setUserInfo:model];
    }else{
        
        self.nameLabel.hidden = YES;
        self.betAmountLabel.hidden = YES;
        self.userInteractionEnabled = YES;
        self.emptyBtn.hidden = NO;
        self.emptyBtn.enabled = YES;
        self.imageView.hidden = YES;
    }
}

- (void)setUserInfo:(ZJJGameUserInfoModel *)model{
    
    
    self.nameLabel.text = model.name;
    self.betAmountLabel.text = [NSString stringWithFormat:@"%ld",model.betAmount];
    self.imageView.image = [UIImage imageNamed:model.headerIcon];
}

//名字
- (UILabel *)nameLabel{

if (!_nameLabel) {

   _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 20)];

   _nameLabel.font = [UIFont systemFontOfSize:12];
    _nameLabel.numberOfLines = 1;
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    
}
    
    return _nameLabel;
}

//筹码
- (UILabel *)betAmountLabel{
    
    if (!_betAmountLabel) {
        
        _betAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,self.bounds.size.height-userBetH, self.bounds.size.width, userBetH)];
        _betAmountLabel.font = [UIFont systemFontOfSize:12];
        _betAmountLabel.textColor = [UIColor grayColor];
        _betAmountLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _betAmountLabel;
}

- (UIButton *)emptyBtn{
    
    if (!_emptyBtn) {
        
        CGFloat imageViewWH = MIN(self.bounds.size.width, self.bounds.size.height-self.nameLabel.bounds.size.height-self.betAmountLabel.bounds.size.height);
        _emptyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, imageViewWH, imageViewWH)];
        _emptyBtn.center = self.center;
        _emptyBtn.layer.masksToBounds = YES;
        _emptyBtn.layer.cornerRadius = imageViewWH/2.0;
        _emptyBtn.alpha = 0.3;
        _emptyBtn.titleLabel.numberOfLines = 0;
        [_emptyBtn setTitle:@"虚位\n以待" forState:UIControlStateNormal];
        _emptyBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _emptyBtn.titleLabel.font = [UIFont systemFontOfSize:[UIScreen mainScreen].bounds.size.width>320?14:12];
        _emptyBtn.backgroundColor = [UIColor blackColor];
    }
    
    return _emptyBtn;
}

- (UIImageView *)imageView{

    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.emptyBtn.frame];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = self.emptyBtn.layer.cornerRadius;
    }
    return _imageView;
}

@end
