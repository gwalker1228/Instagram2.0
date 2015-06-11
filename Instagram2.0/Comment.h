//
//  Comment.h
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/10/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <Parse/Parse.h>

@class User;
@class Photo;

@interface Comment : PFObject <PFSubclassing>

@property NSString *text;
@property User *user;
@property Photo *photo;

+(void)commentWithText:(NSString *)text byUser:(User *)user onPhoto:(Photo *)photo withCompletion:(void (^)(Comment *))complete;
-(void)removeRelationshipsAndDelete;

@end
