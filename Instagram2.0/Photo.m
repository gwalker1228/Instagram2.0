//
//  Photo.m
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>
#import "Photo.h"
#import "User.h"
#import "Comment.h"

@implementation Photo

@dynamic imageFile;
@dynamic userPosted;
@dynamic likesCount;
@dynamic commentsCount;

+(instancetype)objectWithImage:(UIImage *)image fromUser:(User *)user {

    Photo *photo = [super object];

    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    photo.imageFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@_%d.jpg", user.objectId, user.photosPostedCount + 1] data:imageData];

    return photo;
}

+(void)photoWithImage:(UIImage *)image fromUser:(User *)user withCompletion:(void (^)(Photo *))complete {

    Photo *photo = [Photo objectWithImage:image fromUser:user];

    [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        if (!error) {
            [user addPhotosPostedObject:photo];
            complete(photo);
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

+(NSString * __nonnull)parseClassName {
    return @"Photo";
}


-(void)addUserLikesObject:(User *)user {

    [user addPhotosLikedObject:self];
}

-(void)removeUserLikesObject:(User *)user {

    [user removePhotosLikedObject:self];
}

-(void)addCommentsObject:(Comment *)comment {

    PFRelation *relation = [self relationForKey:@"comments"];
    [relation addObject:comment];
    self.commentsCount++;

    // Inverse relationship: set comments's photo property
    comment.photo = self;

    [self save];
    [comment save];
}

-(void)removeCommentsObject:(Comment *)comment {

    [comment.user removeAndDeleteCommentsObject:comment];
}

-(PFImageView *)getImageView {

    PFImageView *imageView = [PFImageView new];
    NSLog(@"HERE'S THE IMAGE VIEW: %@", imageView);
    imageView.file = self.imageFile;

    return imageView;
}

@end




