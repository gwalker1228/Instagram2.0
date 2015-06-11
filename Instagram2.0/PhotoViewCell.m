//
//  PhotoViewCell.m
//  Instagram2.0
//
//  Created by Adriana Jimenez Mangas on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "PhotoViewCell.h"

@interface PhotoViewCell ()

@property (strong, nonatomic) UIImageView *imageView;

@end


@implementation PhotoViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.image = [UIImage imageNamed:@"empty.jpg"];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;

}

@end
