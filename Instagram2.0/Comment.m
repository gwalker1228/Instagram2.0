//
//  Comment.m
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/10/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>

#import "Comment.h"
#import "Photo.h"
#import "User.h"

@implementation Comment

@dynamic text;
@dynamic user;
@dynamic photo;

+(NSString * __nonnull)parseClassName {
    return @"Comment";
}

+(instancetype)objectWithText:(NSString *)text user:(User *)user photo:(Photo *)photo {

    Comment *comment = [super object];

    comment.text = text;
    comment.user = user;
    comment.photo = photo;

    return comment;
}

+(void)commentWithText:(NSString *)text byUser:(User *)user onPhoto:(Photo *)photo withCompletion:(void (^)(Comment *))complete {

    Comment *comment = [Comment objectWithText:text user:user photo:photo];

    [comment saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        if (!error) {
            [user addCommentsObject:comment];
            [photo addCommentsObject:comment];

            complete(comment);
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

-(void)removeRelationshipsAndDelete {

    [self.user removeAndDeleteCommentsObject:self];
}

@end
