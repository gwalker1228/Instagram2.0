//
//  Photo.h
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@class User;
@class Comment;

@interface Photo : PFObject <PFSubclassing>

@property PFFile *imageFile;
@property User *userPosted;
@property int likesCount;
@property int commentsCount;

+(void)photoWithImage:(UIImage *)image fromUser:(User *)user withCompletion:(void (^)(Photo *photo))complete;

-(void)addUserLikesObject:(User *)user;
-(void)removeUserLikesObject:(User *)user;
-(void)addCommentsObject:(Comment *)comment;
-(void)removeCommentsObject:(Comment *)comment;

-(PFImageView *)getImageView;

@end
