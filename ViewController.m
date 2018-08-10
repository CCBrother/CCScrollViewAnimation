//
//  ViewController.m
//  CCScrollViewAnimation
//
//  Created by ZhangCc on 2018/8/10.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "ViewController.h"
#import "CCAnimationView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define TAG 1000
// 动画偏移量 指rightView相对于leftView的偏移量
#define AnimationOffset 100

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 7, SCREEN_HEIGHT);
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    for (int i = 0; i < 7 ; i++) {
        CCAnimationView *animationView = [[CCAnimationView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        animationView.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [scrollView addSubview:animationView];
        animationView.tag = TAG + i;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 偏移量x
    CGFloat x = scrollView.contentOffset.x;
    
    NSInteger leftIndex = x/SCREEN_WIDTH;
    //    NSLog(@"%ld",leftIndex);
    
    //这里的left和right是区分拖动中可见的两个视图
    CCAnimationView * leftView = [scrollView viewWithTag:(leftIndex + TAG)];
    CCAnimationView * rightView = [scrollView viewWithTag:(leftIndex + 1 + TAG)];
    
    // 移动距离
    CGFloat moveLength = SCREEN_WIDTH - AnimationOffset;
    
    // leftView横坐标
    CGFloat leftViewX = (leftIndex + 1) * SCREEN_WIDTH;
    // leftView拖拽距离
    CGFloat leftDragLength = x - leftViewX;
    // leftView移动百分比
    CGFloat leftMovePer = leftDragLength / SCREEN_WIDTH;
    
    leftView.imageViewX = (moveLength +  leftMovePer * moveLength);
    
    NSLog(@"leftView.contentX: %.2f",leftView.imageViewX);
    
    // rightView横坐标
    CGFloat rightViewX = leftIndex * SCREEN_WIDTH;
    // rightView拖拽距离
    CGFloat rightDragLength = x - rightViewX;
    // rightView移动百分比
    CGFloat rightMovePer = rightDragLength / SCREEN_WIDTH;
    
    rightView.imageViewX = - moveLength + rightMovePer * moveLength;
    
    NSLog(@"rightView.contentX: %.2f",rightView.imageViewX);
    
    
}




@end
