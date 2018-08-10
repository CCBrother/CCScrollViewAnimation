//
//  CCAnimationView.h
//  CCScrollViewAnimation
//
//  Created by ZhangCc on 2018/8/10.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCAnimationView : UIView

@property (nonatomic, strong) UIImageView * imageView;

// imageView的横坐标，用于拖拽过程中的动画
@property (nonatomic, assign) CGFloat imageViewX;

@end
