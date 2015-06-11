//
//  ViewController.m
//  Instagram2.0
//
//  Created by Gretchen Walker on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "MainPhotoStreamViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "User.h"

@interface MainPhotoStreamViewController ()

@end

@implementation MainPhotoStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];


//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UINavigationController *navigationLoginVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginNavigationVC"];
//
//    double delayInSeconds = 0.1;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){  // W2
//        [self.parentViewController presentViewController:navigationLoginVC animated:YES completion:nil]; // W1
//    });



}


@end



// Warning1: "Presenting view controllers on detached view controllers is discouraged..."
// Solution1: Let the parentVC to present a VC over a small view (TabBar and NavBar)

// Warning2: "Unbalanced calls to begin/end appearance transitions..."
// Solution2: You need to wait to present the modal view controller until the next run loop. It just stops warnings


