//
//  User.h
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@class Photo;
@class Comment;

@interface User : PFUser <PFSubclassing>

@property PFImageView *profilePicture;
@property int photosPostedCount;
@property int photosLikedCount;
@property int usersFollowingCount;
@property int commentsCount;

+(void)userWithUserName:(NSString *)username password:(NSString *)password email:(NSString *)email withCompletion:(void(^)(User *user))complete;

-(void)addUsersFollowingObject:(User *)user;
-(void)addPhotosPostedObject:(Photo *)photo;
-(void)addPhotosLikedObject:(Photo *)photo;
-(void)addCommentsObject:(Comment *)comment;

-(void)removeUsersFollowingObject:(User *)user;
-(void)removeAndDeletePhotosPostedObject:(Photo *)photo;
-(void)removePhotosLikedObject:(Photo *)photo;
-(void)removeAndDeleteCommentsObject:(Comment *)comment;

-(void)photosPostedWithCompletion:(void (^)(NSArray *photos))complete;
-(NSArray *)photosPosted;

@end
