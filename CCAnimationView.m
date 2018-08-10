//
//  CCAnimationView.m
//  CCScrollViewAnimation
//
//  Created by ZhangCc on 2018/8/10.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "CCAnimationView.h"

@implementation CCAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_imageView];
    }
    return self;
}

- (void)setImageViewX:(CGFloat)imageViewX {
    _imageViewX = imageViewX;
    _imageView.frame = CGRectMake(imageViewX, 0, self.frame.size.width, self.frame.size.height);
}


@end
