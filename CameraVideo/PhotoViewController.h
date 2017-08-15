//
//  PhotoViewController.h
//  CameraVideo
//
//  Created by Mani Batra on 29/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface PhotoViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate>
- (IBAction)loadPhotoPicker:(id)sender;

@end
