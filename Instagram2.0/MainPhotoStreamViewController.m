//
//  ViewController.m
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "MainPhotoStreamViewController.h"
#import <Parse/Parse.h>

@interface MainPhotoStreamViewController ()

@end

@implementation MainPhotoStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];

}


@end
