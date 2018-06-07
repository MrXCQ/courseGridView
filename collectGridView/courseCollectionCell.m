//
//  courseCollectionCell.m
//  collectGridView
//
//  Created by zc on 2018/6/6.
//  Copyright © 2018年 Chomp.IMpBear. All rights reserved.
//

#import "courseCollectionCell.h"
#import "UIColor+Chomp.h"
@implementation courseCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width ;
        CGFloat layoutS = screenW / 375.0 ;
        
        CGFloat itemW = (screenW - 50 *layoutS ) /5;
        CGFloat itemH = itemW /13 *16;
        
        self.contentView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.contentView.layer.borderWidth = 0.3f ;
        
        self.contentView.backgroundColor = [UIColor whiteColor] ;
        
        self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, itemW, itemH)] ;
        self.containerView.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.containerView.layer.borderWidth = 0.8f ;
        
        self.containerView.layer.cornerRadius = 6;
        self.containerView.clipsToBounds = YES;
        [self.contentView addSubview:self.containerView];
        
        //img
        self.voiceImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
        self.voiceImgView.image = [UIImage imageNamed:@"铃声已设置"] ;
        self.voiceImgView.center = CGPointMake(self.containerView.center.x, self.containerView.center.y + 15) ;
        [self.containerView addSubview:self.voiceImgView];
        
        //titleLable
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, itemW, itemH/2)];
        self.titleLable.backgroundColor = [UIColor clearColor] ;
        self.titleLable.textAlignment = NSTextAlignmentCenter ;
        self.titleLable.font = [UIFont systemFontOfSize:12] ;
        self.titleLable.numberOfLines = 0 ;
        self.titleLable.textColor = [UIColor whiteColor] ;
        self.titleLable.text = @"英语" ;
        
        [self.containerView addSubview:self.titleLable];
  
    }
    return self;
}


@end
