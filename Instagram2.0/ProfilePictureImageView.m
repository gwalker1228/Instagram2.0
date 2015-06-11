//
//  ProfilePictureImageView.m
//  Instagram2.0
//
//  Created by Adriana Jimenez Mangas on 6/10/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "ProfilePictureImageView.h"

@implementation ProfilePictureImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    self.layer.borderWidth = 3.0;
    self.layer.cornerRadius = 50;
}*/

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    self.clipsToBounds = YES;
    self.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 50.0;

    return self;
}




@end
