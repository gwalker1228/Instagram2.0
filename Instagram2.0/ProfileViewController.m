//
//  ProfileViewController.m
//  Instagram2.0
//
//  Created by Adriana Jimenez Mangas on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "ProfileViewController.h"
#import "PhotoViewCell.h"

static NSString *reuseIdentifier = @"PhotoCell";

@interface ProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@property (weak, nonatomic) IBOutlet UILabel *numberOfPostsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfFollowersLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfFollowingLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ProfileViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"My profile";
    [self setInitialCollectionViewLayout];
}


- (void)setInitialCollectionViewLayout {
    [self.collectionView registerClass:[PhotoViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor darkGrayColor];
    self.collectionView.layer.borderColor = [UIColor darkGrayColor].CGColor;      // orannge?
    self.collectionView.layer.borderWidth = 0.5;                                // orange?

    /**** new size ****/
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(106, 106);
    [flowLayout setMinimumInteritemSpacing:1.0f];
    [flowLayout setMinimumLineSpacing:1.0f];
    [self.collectionView setCollectionViewLayout:flowLayout];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}


-(IBAction)unwindFromPostPhoto:(UIStoryboardSegue *)segue {

}

@end




