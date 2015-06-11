//
//  UsersViewController.m
//  Instagram2.0
//
//  Created by Adriana Jimenez Mangas on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "UsersViewController.h"

@interface UsersViewController () <UITableViewDataSource, UITabBarDelegate>

@end

@implementation UsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Users";

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];

    return cell;
}

@end
