//
//  User.m
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>
#import "User.h"
#import "Photo.h"
#import "Comment.h"

@implementation User

@dynamic profilePicture;
@dynamic photosPostedCount;
@dynamic photosLikedCount;
@dynamic usersFollowingCount;
@dynamic commentsCount;


+(instancetype)objectWithUserName:(NSString *)username password:(NSString *)password email:(NSString *)email {

    User *user = [super object];

    user.username = username;
    user.password = password;
    user.email = email;

    user.photosPostedCount = 0;
    user.photosLikedCount = 0;
    user.usersFollowingCount = 0;

    return user;
}

+(void)userWithUserName:(NSString *)username password:(NSString *)password email:(NSString *)email withCompletion:(void(^)(User *user))complete {

    User *user = [User objectWithUserName:username password:password email:email];

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        if (!error) {
            complete(user);
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

-(void)setupUsersFollowingRelationship:(User *)user {

    PFRelation *relation = [self relationForKey:@"usersFollowing"];
    [relation addObject:user];
    self.usersFollowingCount++;

    [self save];
}

-(void)addUsersFollowingObject:(User *)user {

    [self setupUsersFollowingRelationship:user];
    [user setupUsersFollowingRelationship:self];
}

-(void)addPhotosPostedObject:(Photo *)photo {

    PFRelation *relation = [self relationForKey:@"photosPosted"];
    [relation addObject:photo];
    self.photosPostedCount++;

    // Inverse relationship: set photo's userPosted property
    photo.userPosted = self;

    [self save];
    [photo save];
}

-(void)setupPhotoLikedRelationship:(Photo *)photo {

    PFRelation *userRelation = [self relationForKey:@"photosLiked"];
    [userRelation addObject:photo];
    self.photosLikedCount++;

    PFRelation *photoRelation = [photo relationForKey:@"userLikes"];
    [photoRelation addObject:self];
    photo.likesCount++;

    [self save];
    [photo save];

}

-(void)addPhotosLikedObject:(Photo *)photo {

    [self setupPhotoLikedRelationship:photo];
}

-(void)addCommentsObject:(Comment *)comment {

    PFRelation *relation = [self relationForKey:@"comments"];
    [relation addObject:comment];
    self.commentsCount++;

    // Inverse relationship: set photo's userPosted property
    //comment.user = self;

    [self save];
   // [comment saveInBackground];
}


-(void)removeUsersFollowingRelationship:(User *)user {

    PFRelation *relation = [self relationForKey:@"usersFollowing"];
    [relation removeObject:user];
    self.usersFollowingCount--;

    [self save];
}

-(void)removeUsersFollowingObject:(User *)user {

    [self removeUsersFollowingRelationship:user];
    [user removeUsersFollowingRelationship:self];
}

-(void)removeAndDeletePhotosPostedObject:(Photo *)photo {

    PFRelation *relation = [self relationForKey:@"photosPosted"];
    [relation removeObject:photo];
    self.photosPostedCount--;

    [self save];
    [photo delete];
}

-(void)removePhotosLikedRelationship:(Photo *)photo {

    PFRelation *userRelation = [self relationForKey:@"photosLiked"];
    [userRelation removeObject:photo];
    self.photosLikedCount--;

    PFRelation *photoRelation = [photo relationForKey:@"userLikes"];
    [photoRelation removeObject:self];
    photo.likesCount--;

    [self save];
    [photo save];
}

-(void)removePhotosLikedObject:(Photo *)photo {

    [self removePhotosLikedRelationship:photo];
}

-(void)removeAndDeleteCommentsObject:(Comment *)comment {

    Photo *photo = comment.photo;

    PFRelation *userRelation = [self relationForKey:@"comments"];
    [userRelation removeObject:comment];
    self.commentsCount--;

    PFRelation *photoRelation = [photo relationForKey:@"comments"];
    [photoRelation removeObject:comment];
    photo.commentsCount--;

    [self save];
    [photo save];

    [comment delete];
}

-(void)photosPostedWithCompletion:(void (^)(NSArray *photos))complete {

    PFQuery *query = [PFQuery queryWithClassName:@"Photo"];
    [query whereKey:@"userPosted" equalTo:self];

    [query findObjectsInBackgroundWithBlock:^(NSArray *photoArray, NSError *error) {
        if (photoArray) {
            complete(photoArray);
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

-(NSArray *)photosPosted {

    PFQuery *query = [PFQuery queryWithClassName:@"Photo"];
    [query whereKey:@"userPosted" equalTo:self];

    return [query findObjects];
}

-(void)photosLikedWithCompletion:(void (^)(NSArray *photos))complete {

    PFQuery *query = [PFQuery queryWithClassName:@"Photo"];
    [query whereKey:@"userLikes" equalTo:self];

    [query findObjectsInBackgroundWithBlock:^(NSArray *photoArray, NSError *error) {
        if (photoArray) {
            complete(photoArray);
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

-(NSArray *)photosLiked {

    PFQuery *query = [PFQuery queryWithClassName:@"Photo"];
    [query whereKey:@"userLikes" equalTo:self];

    return [query findObjects];
}


@end







