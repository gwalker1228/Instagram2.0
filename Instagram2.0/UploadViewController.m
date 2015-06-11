//
//  UploadViewController.m
//  Instagram2.0
//
//  Created by Adriana Jimenez Mangas on 6/9/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "UploadViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface UploadViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *postTextView;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

//@property UIImagePickerController *picker;
//@property BOOL newMedia;


@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Upload Photo";
    self.postImageView.layer.borderWidth = 1.0;
    self.postTextView.layer.borderWidth = 1.0;

    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}


- (IBAction)onCameraButton:(UIButton *)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Simulator has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];

        [myAlertView show];
        
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc ] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = @[(NSString *)kUTTypeImage];
        picker.allowsEditing = NO;

        [self presentViewController:picker animated:YES completion:nil];

    }
}


- (IBAction)onPhotoLibraryButton:(UIButton *)sender {

        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes = @[(NSString *)kUTTypeImage];
        picker.allowsEditing = NO;

        [self presentViewController:picker animated:YES completion:nil];

}

-(void)prepareImagePicker {

}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    [self dismissViewControllerAnimated:YES completion:nil];

    NSString *mediaType = info[UIImagePickerControllerMediaType];

    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.postImageView.image = image;
    }
}


- (IBAction)onPostButton:(UIButton *)sender {
}



@end


