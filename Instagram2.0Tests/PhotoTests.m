//
//  PhotoTests.m
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/10/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

#import "User.h"
#import "Photo.h"
#import "Comment.h"

@interface PhotoTests : XCTestCase

@end

@implementation PhotoTests

- (void)setUp {
    [super setUp];

    User *user = [User currentUser];
    [user fetch];

    XCTAssertNotNil(user);
    XCTestExpectation *expectation = [self expectationWithDescription:@""];

    [Photo photoWithImage:[UIImage imageNamed:@"default"] fromUser:user withCompletion:^(Photo *photo) {
        NSLog(@"Photo created");
        XCTAssertNotNil(user);
        XCTAssertGreaterThan(user.photosPostedCount, 0);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:5 handler:nil];

}


- (void)testGetAllPhotosPostedByUser {

    User *user = [User currentUser];
    [user fetch];

    NSArray *photos = [user photosPosted];
        
    XCTAssertEqual(photos.count, user.photosPostedCount);
}

- (void)testPhotoImageViewExists {

    Photo *photo = [self getPhoto];

    XCTAssertNotNil(photo);
    NSLog(@"%@", photo);
    XCTAssertNotNil(photo.imageFile);
}

-(void)testLikePhoto {

    Photo *photo = [self getPhoto];
    User *user = [User currentUser];

    [user fetch];

    [user addPhotosLikedObject:photo];

}

-(Photo *)getPhoto {

    User *user = [User currentUser];
    [user fetch];

    NSArray *photos = [user photosPosted];
    return photos.firstObject;
}

- (void)tearDown {
    [super tearDown];

    User *user = [User currentUser];
    [user fetch];

    NSArray *photos = [user photosPosted];
    NSUInteger photoCount = photos.count;
    NSLog(@"%lu photos", photoCount);

    Photo *photo = photos.firstObject;

    [user removeAndDeletePhotosPostedObject:photo];

    XCTAssertEqual(photoCount-1, user.photosPostedCount);
    NSLog(@"%d photos", user.photosPostedCount);
}





@end
